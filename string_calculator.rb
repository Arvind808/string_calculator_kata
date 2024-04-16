class StringCalculator

  def add(string)
    return 0 if string.empty?

    sum = 0
    string.split(',').map do |string|
      sum += string.to_i
    end
    sum
  end
end
