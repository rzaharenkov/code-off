require_relative '../lib/morse_translator'

RSpec.describe MorseTranslator do
  describe '#process' do
    it 'translates letters' do
      expect(subject.process('HELLO')).to eq('....|.|.-..|.-..|---')
    end

    it 'translates digits' do
      expect(subject.process('321')).to eq('...--|..---|.----')
    end

    it 'translates dots and commas' do
      expect(subject.process('..,')).to eq('.-.-.-|.-.-.-|--..--')
    end

    it 'separates words' do
      expect(subject.process('A DOG')).to eq('.-/-..|---|--.')
    end

    it 'handles sentences with words, comma and dot' do
      sentence = 'Lorem ipsum, consectetur elit.'
      morse_code = '.-..|---|.-.|.|--/..|.--.|...|..-|--|--..--/-.-.|---|-.|...|.|-.-.|-|.|-|..-|.-./.|.-..|..|-|.-.-.-'

      expect(subject.process(sentence)).to eq(morse_code)
    end

    it 'raises error if input contains not supported characters' do
      expect { subject.process('how are yuo?') }.to raise_error(MorseTranslator::InvalidCharacterError)
    end
  end
end
