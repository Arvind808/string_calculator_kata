class StringCalculator

  def add(string)
    return 0 if string.empty?

    delimiter = extract_delimiter(string)
    numbers = extract_numbers(string, delimiter)
    numbers.map(&:to_i).inject(:+)
  end

  private

  def extract_delimiter(string)
    if string.start_with?('//')
      string[2]
    else
      ','
    end
  end

  def extract_numbers(string, delimiter)
    if string.start_with?('//')
      string = string.split('\n', 2)[1]
    end
    string.split(/#{Regexp.escape(delimiter)}|\n/)
  end
end
