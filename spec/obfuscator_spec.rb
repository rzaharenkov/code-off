require_relative '../lib/obfuscator'

RSpec.describe Obfuscator do
  describe '#process' do
    shared_examples 'replacement' do |input, expected_result|
      it "replaces '#{input}' with '#{expected_result}'" do
        expect(subject.process(input)).to eq(expected_result)
      end
    end

    include_examples 'replacement', '.', '1'
    include_examples 'replacement', '...', '3'
    include_examples 'replacement', '.........', '9'

    include_examples 'replacement', '-', 'A'
    include_examples 'replacement', '-----', 'E'
    include_examples 'replacement', '------', 'F'

    include_examples 'replacement', '..---', '2C'
    include_examples 'replacement', '-....', 'A4'

    include_examples 'replacement', '-.|.|..', 'A1|1|2'
    include_examples 'replacement', '-.|.---.|---/__AB123_.-', 'A1|1C1|C/__AB123_1A'
  end
end
