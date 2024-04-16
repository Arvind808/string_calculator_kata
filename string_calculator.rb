class StringCalculator

  def add(string)
    return 0 if string.empty?

    numbers = string.split(/,|\n/)
    numbers.map(&:to_i).inject(:+)
  end
end
