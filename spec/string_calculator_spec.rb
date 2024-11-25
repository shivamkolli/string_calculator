require 'utilities/string_calculator'

RSpec.describe Utilities::StringCalculator do

  describe 'add' do
    it 'returns 0 for empty string' do
      expect(Utilities::StringCalculator.add('')).to eq(0)
    end

    context 'single number' do
      it "returns 1 for '1'" do
        expect(Utilities::StringCalculator.add('1')).to eq(1)
      end

      it "returns 2 for '2'" do
        expect(Utilities::StringCalculator.add('2')).to eq(2)
      end
    end
  end

end
