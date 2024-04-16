class StringCalculator

  def add(string)
    negatives = find_negatives(string)
    raise ArgumentError, "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?

    return 0 if string.empty?

    delimiter = extract_delimiter(string)
    numbers = extract_numbers(string, delimiter)
    sanitized_numbers = sanitize_numbers(numbers)
    sanitized_numbers.inject(:+)
  end

  private

  def find_negatives(string)
    string.scan(/-\d+/)
  end

  def extract_delimiter(string)
    string.start_with?('//') ? string[2] : ','
  end

  def extract_numbers(string, delimiter)
    string.start_with?('//') ? string.split('\n', 2)[1].split(/#{Regexp.escape(delimiter)}|\n/) : string.split(/#{Regexp.escape(delimiter)}|\n/)
  end

  def sanitize_numbers(numbers)
    numbers.map(&:to_i).reject { |num| num > 1000 }
  end
end
