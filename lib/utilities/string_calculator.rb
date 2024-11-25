# frozen_string_literal: true

# Utilities::StringCalculator.add(input)
module Utilities
  module StringCalculator
    NUMBER_TOO_BIG = 1000
    class << self
      def add(input)
        return 0 if input.empty?

        values = extract_values(input)
        raise_error_if_negative_integer(values)

        addition_of_valid_integers(values)
      end

      private

      def extract_values(input)
        input.split(/[^0-9-]+/).map(&:to_i)
      end

      def raise_error_if_negative_integer(array)
        negatives = array.select(&:negative?)
        return false if negatives.none?

        raise "negative numbers not allowed - (#{negatives.join(', ')})"
      end

      def addition_of_valid_integers(array)
        valid_integers = array.select { |i| i < NUMBER_TOO_BIG }

        valid_integers.sum
      end
    end
  end
end
