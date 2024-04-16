require_relative 'string_calculator'

RSpec.describe StringCalculator do

  describe 'Add string' do
    context 'when given an empty string' do
      it 'returns 0' do
        string = StringCalculator.new
        expect(string.add("")).to eq(0)
      end
    end

    context 'when given a single number' do
      it 'returns the number' do
        calculator = StringCalculator.new
        expect(calculator.add('1')).to eq(1)
      end
    end
  end
end
