class StringCalculator

  def add(string)
    negatives = find_negatives(string)
    raise ArgumentError, "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?

    return 0 if string.empty?

    delimiter = extract_delimiter(string)
    numbers = extract_numbers(string, delimiter)
    numbers.map(&:to_i).inject(:+)
  end

  private

  def find_negatives(string)
    negatives = string.scan(/-\d+/)
    negatives.empty? ? [] : negatives
  end

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
