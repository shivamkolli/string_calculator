# frozen_string_literal: true

require 'utilities/string_calculator'

RSpec.describe Utilities::StringCalculator do
  describe 'add' do
    it 'returns 0 for empty string' do
      expect(described_class.add('')).to eq(0)
    end

    context 'single number' do
      it "returns 1 for '1'" do
        expect(described_class.add('1')).to eq(1)
      end

      it "returns 2 for '2'" do
        expect(described_class.add('2')).to eq(2)
      end
    end

    context 'two numbers' do
      it "returns 3 for the string '1,2'" do
        expect(described_class.add('1,2')).to eq(3)
      end

      it "returns 1 for the string '0, 1'" do
        expect(described_class.add('0,1')).to eq(1)
      end

      it "returns 3 for the string '3, 0'" do
        expect(described_class.add('3,0')).to eq(3)
      end

      it "returns 200 for the string '190, 10'" do
        expect(described_class.add('190,10')).to eq(200)
      end

      it "returns 328 for the string '78, 250'" do
        expect(described_class.add('78,250')).to eq(328)
      end
    end

    context 'ignore numbers greater than 1000' do
      it "returns 3 for the string '1,2,1000'" do
        expect(described_class.add('1,2,1000')).to eq(3)
      end

      it "returns 0 for the string '1000,1500'" do
        expect(described_class.add('1000,1500')).to eq(0)
      end

      it "returns 1000 for the string '1,999,1000'" do
        expect(described_class.add('1,999,1000')).to eq(1000)
      end
    end

    context 'negative numbers' do
      it 'raises exception when string contains a negative number' do
        expect { described_class.add('-1') }.to raise_error('negative numbers not allowed - (-1)')
      end

      it 'raises exception when string contains single negative number' do
        expect { described_class.add('2, -1') }.to raise_error('negative numbers not allowed - (-1)')
      end

      it 'raises exception when string contains multiple negative numbers' do
        expect do
          described_class.add('2, -1, -30')
        end.to raise_error('negative numbers not allowed - (-1, -30)')
      end
    end

    context 'delimiters' do
      it "returns 3 for the string '//;\n1;2'" do
        expect(described_class.add("//;\n1;2")).to eq(3)
      end

      it "returns 6 for the string '//;\n1;2;3,'" do
        expect(described_class.add("//;\n1;2;3")).to eq(6)
      end

      it "returns 8 for the string '3\n2\n3, 0'" do
        expect(described_class.add("//;3\n2;\n3, 0")).to eq(8)
      end

      it "returns 6 for the string '//[***]\n1***2***3'" do
        expect(described_class.add("//[***]\n1***2***3")).to eq(6)
      end

      it "returns 6 for the string '//[*][%]\n1*2%3'" do
        expect(described_class.add("//[*][%]\n1*2%3")).to eq(6)
      end

      it "returns 12 for the string '//*\n1*4*3'" do
        expect(described_class.add("//*\n1*4*3")).to eq(12)
      end
    end
  end
end
