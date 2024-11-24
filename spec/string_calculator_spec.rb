require 'utilities/string_calculator'

RSpec.describe Utilities::StringCalculator do

  describe 'add' do
    it 'returns 0 for empty string' do
      expect(Utilities::StringCalculator.add('')).to eq(0)
    end
  end

end
