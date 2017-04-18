# Obfuscates Morse code message with the following rules:
#   - replace the number of consecutive dots(.) with a number;
#   - replace the number of consecutive dashes(-) with the letter of the alphabet at that position;
#
# E.g. ...  = 3,
#      --.- = B1A,
#      ..-. = 2A1
#
# Examples:
#
#   Obfuscator.new.process('.../--.-/..-.') #=> "3/B1A/2A1"
#
class Obfuscator
  DOT = /\.+/
  DASH = /\-+/

  A_CHAR_CODE = 'A'.ord

  # Returns obfuscated message.
  def process(message)
    process_dashes(process_dots(message))
  end

  private

  def process_dots(message)
    message.gsub(DOT) { |c| c.size }
  end

  def process_dashes(message)
    message.gsub(DASH) { |c| (A_CHAR_CODE + c.size - 1).chr }
  end
end
