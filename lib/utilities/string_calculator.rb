module Utilities
  module StringCalculator
    class << self

      def add(input)
        return 0 if input.empty?

        values = extract_values(input)
        values.sum
      end

      private

      def extract_values(input)
        input.split(/[^0-9-]+/).map(&:to_i)
      end

    end
  end
end
