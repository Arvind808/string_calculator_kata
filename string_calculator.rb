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
    if string.start_with?('//')
      if string.include?('[') && string.include?(']')
        delimiter_start = string.index('[') + 1
        delimiter_end = string.index(']') - 1
        string[delimiter_start..delimiter_end]
      else
        string[2]
      end
    else
      ','
    end
  end

  def extract_numbers(string, delimiter)
    string.split(/#{Regexp.escape(delimiter)}|\n/)
  end

  def sanitize_numbers(numbers)
    numbers.map(&:to_i).reject { |num| num > 1000 }
  end
end
