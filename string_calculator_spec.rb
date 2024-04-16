require_relative 'string_calculator'

RSpec.describe StringCalculator do

  describe 'Add string' do
    context 'when given an empty string' do
      it 'returns 0' do
        string = StringCalculator.new
        expect(string.add('')).to eq(0)
      end
    end

    context 'when given a single number' do
      it 'returns the number' do
        calculator = StringCalculator.new
        expect(calculator.add('1')).to eq(1)
      end
    end

    context 'when given two numbers separated by a comma' do
      it 'returns the sum of the numbers' do
        calculator = StringCalculator.new
        expect(calculator.add('1,2')).to eq(3)
      end
    end

    context 'when given multiple numbers separated by commas and new lines' do
      it 'returns the sum of the numbers' do
        expect(StringCalculator.new.add("1\n2,3")).to eq(6)
      end
    end

    context 'when given a custom delimiter' do
      it 'returns the sum of the numbers using the custom delimiter' do
        expect(StringCalculator.new.add("//;\n1;2")).to eq(3)
      end
    end

    context 'when given a negative number' do
      it "throws an exception 'negatives not allowed' and includes the negative number" do
        expect { StringCalculator.new.add('1,-2') }.to raise_error(ArgumentError, 'negatives not allowed: -2')
      end
    end
  end
end
