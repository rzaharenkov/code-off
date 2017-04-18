require_relative '../lib/client'

RSpec.describe Client do
  subject { described_class.new(input, output) }

  let(:input) { File.new('spec/test_data/success_test.txt') }
  let(:output) { instance_double(IO) }

  describe '#run' do
    it 'prints obfuscated Morse code to the output' do
      expect(output).to receive(:puts).with('4|1|1A2|1A2|C')
      expect(output).to receive(:puts).with('2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1')
      subject.run
    end

    context 'when input contains invalid characters' do
      let(:input) { File.new('spec/test_data/invalid_test.txt') }
      let(:error_message) { "Invalid caharacters detected: [\"?\", \"?\", \"?\"], allowed characters are latin leters, digits, comma and dot" }

      it 'prints error description to the output' do
        expect(output).to receive(:puts).with(error_message)
        subject.run
      end
    end
  end
end
