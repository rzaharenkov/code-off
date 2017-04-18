# Translates message to Morse code. Allowed characters are:
#   - latin letters (a-z, A-Z);
#   - digits (0-9);
#   - comma (,);
#   - dot (.).
#
# It separates letters with pipe (|), and separate words with forward slash (/).
#
# Examples:
#
#   MorseTranslator.new.process('HELLO') #=> "....|.|.-..|.-..|---"
#   MorseTranslator.new.process('abc, 123') #=> ".-|-...|-.-.|--..--/.----|..---|...--"
#
# It raises `MorseTranslator::InvalidCharacterError` if input contains not supported characters:
#
#   MorseTranslator.new.process('???') #=> MorseTranslator::InvalidCharacterError: Invalid caharacters detected: ...
#
class MorseTranslator
  class InvalidCharacterError < StandardError
    MESSAGE_TEMPLATE = "Invalid caharacters detected: %s, allowed characters are latin leters, digits, comma and dot".freeze

    def initialize(invalid_characters)
      super(MESSAGE_TEMPLATE % invalid_characters.inspect)
    end
  end

  ALPHABET = {
    "a" => ".-",
    "b" => "-...",
    "c" => "-.-.",
    "d" => "-..",
    "e" => ".",
    "f" => "..-.",
    "g" => "--.",
    "h" => "....",
    "i" => "..",
    "j" => ".---",
    "k" => "-.-",
    "l" => ".-..",
    "m" => "--",
    "n" => "-.",
    "o" => "---",
    "p" => ".--.",
    "q" => "--.-",
    "r" => ".-.",
    "s" => "...",
    "t" => "-",
    "u" => "..-",
    "v" => "...-",
    "w" => ".--",
    "x" => "-..-",
    "y" => "-.--",
    "z" => "--..",
    "1" => ".----",
    "2" => "..---",
    "3" => "...--",
    "4" => "....-",
    "5" => ".....",
    "6" => "-....",
    "7" => "--...",
    "8" => "---..",
    "9" => "----.",
    "0" => "-----",
    "." => ".-.-.-",
    "," => "--..--"
  }.freeze

  INVALID_CHARACTER_REGEX = /[^\w\s,\.]/
  WORD_REGEX = /[\w,\.]+/
  WORD_SEPARATOR = '/'.freeze
  CHAR_REGEX = /./
  CHAR_SEPARATOR = '|'.freeze

  # Returns message translated to the Morse code.
  # Raises `MorseTranslator::InvalidCharacterError` if input contains not supported characters.
  def process(message)
    invalid_characters = message.scan(INVALID_CHARACTER_REGEX)
    raise InvalidCharacterError.new(invalid_characters) if invalid_characters.size > 0

    message.scan(WORD_REGEX).map { |word| translate_word(word) }.join(WORD_SEPARATOR)
  end

  private

  def translate_word(word)
    word.downcase.scan(CHAR_REGEX).map { |char| ALPHABET[char] }.join(CHAR_SEPARATOR)
  end
end
