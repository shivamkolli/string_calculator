# frozen_string_literal: true

# Utilities::StringCalculator.add(input)
module Utilities
  module StringCalculator
    NUMBER_TOO_BIG = 1000
    class << self
      def add(input)
        return 0 if input.empty?

        result_from_extracted_values(input)
      end

      private

      def result_from_extracted_values(input)
        delimiter_section, number_section = input.split("\n")
        delimiter = delimiter_section.split('//').last

        if delimiter.include?('*')
          integers = extract_values(number_section)
          multiplication_of_valid_integers(integers)
        else
          integers = extract_values(input)
          addition_of_valid_integers(integers)
        end
      end

      def extract_values(input)
        input.split(/[^0-9-]+/).reject(&:empty?).map(&:to_i)
      end

      def raise_error_if_negative_integer(array)
        negatives = array.select(&:negative?)
        return false if negatives.none?

        raise "negative numbers not allowed - (#{negatives.join(', ')})"
      end

      def valid_integers(array)
        raise_error_if_negative_integer(array)

        array.select { |i| i < NUMBER_TOO_BIG }
      end

      def addition_of_valid_integers(array)
        integers = valid_integers(array)

        integers.sum
      end

      def multiplication_of_valid_integers(array)
        integers = valid_integers(array)

        integers.reduce(:*)
      end
    end
  end
end
