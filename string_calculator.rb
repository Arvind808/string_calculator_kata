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
    return ',' unless string.start_with?('//')

    if string.include?('[') && string.include?(']')
      delimiters = string.scan(/\[([^\[\]]+)\]/).flatten
      Regexp.union(delimiters)
    else
      string[2]
    end
  end

  def extract_numbers(string, delimiter)
    string.split(/#{delimiter}|\n/)
  end

  def sanitize_numbers(numbers)
    numbers.map(&:to_i).reject { |num| num > 1000 }
  end
end
