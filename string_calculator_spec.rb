require_relative 'string_calculator'

RSpec.describe StringCalculator do

  describe 'Add string' do
    context 'when given an empty string' do
      it 'returns 0' do
        string = StringCalculator.new
        expect(string.add("")).to eq(0)
      end
    end
  end
end
