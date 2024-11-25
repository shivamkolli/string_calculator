module Utilities
  module StringCalculator
    class << self
      def add(input)
        return 0 if input.empty?

        values = extract_values(input)
        raise_error_if_negative_integer(values)

        values.sum
      end

      private

      def extract_values(input)
        input.split(/[^0-9-]+/).map(&:to_i)
      end

      def raise_error_if_negative_integer(array)
        negatives = array.select(&:negative?)
        return false if negatives.length == 0

        raise "negatives not allowed - (#{negatives.join(', ')})"
      end
    end
  end
end
