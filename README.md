# StringCalculator

A simple Ruby based `StringCalculator` utility module that adds numbers from a provided string input. This calculator supports comma-separated values, newlines as delimiters, custom delimiters, and handles errors for negative numbers and also ignores numbers that are greater than 1000.

## Features

- **Basic Addition**: Adds numbers provided in a comma-separated string.
- **Newline Support**: Handles newlines between numbers, e.g., `"1\n2,3"`.
- **Custom Delimiters**: Allows custom delimiters specified in the format `"//[delimiter]\n[numbers…]"`.
  - Example: `"//;\n1;2"` returns `3`.
- **Error Handling for negative integers**: Throws an error if negative numbers are present in the input, listing all negative values.
- **Ignore bigger integers**: Ignore integers greater than 1000 and return sum for remaining integers.

## Setup

1. Clone this repository:
   ```
   git clone https://github.com/shivamkolli/string_calculator.git
   cd string_calculator

   ```

2. Ensure you have Ruby installed (version 3.0 or higher is recommended).
3. Install rspec for testing:

  ```
  gem install rspec

  ```

## Usage

#### Example
You can use the `StringCalculator` utility module as follows:

  ```
    require 'utilities/string_calculator'

    puts Utilities::StringCalculator.add("1,2,3")          # Output: 6
    puts Utilities::StringCalculator.add("1\n2,3")         # Output: 6
    puts Utilities::StringCalculator.add("//;\n1;2")       # Output: 3

    # For negative integers raise an exception
    
    puts Utilities::StringCalculator.add("1,-2,3")         # Output: negative numbers not allowed: -2

    # Ignore integers greater than 1000 and return sum of remaining integers

    puts Utilities::StringCalculator.add('1,2,1000')       # Output: 3
    
  ```

## How It Works

- **Split string input and extract integers**: The method extracts only numbers from 0 to 9 using regex `/[^0-9-]+/` by spitting it and then it converts these numbers into array of integers.
- **Negative Numbers Check**: Check for any negative numbers and raises an error if found.
- **Ignore big integers**: Before summing, check for integers greater than 1000 and ignore them. Return sum of remaining integers.
- **Sum Calculation**: Return sum of array of integers.


## Testing
RSpec specs have been covered to validate all the edge cases.

Run the tests by navigating to the project directory and executing:
```
rspec spec/string_calculator_spec.rb

```
