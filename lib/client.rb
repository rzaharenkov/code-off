require_relative 'morse_translator'
require_relative 'obfuscator'

class Client
  def initialize(input, output = STDOUT)
    @input = input
    @output = output
    @translator = MorseTranslator.new
    @obfuscator = Obfuscator.new
  end

  def run
    while line = @input.gets
      begin
        @output.puts(@obfuscator.process(@translator.process(line.chomp)))
      rescue MorseTranslator::InvalidCharacterError => e
        @output.puts(e.message)
      end
    end
  end
end
