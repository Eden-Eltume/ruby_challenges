=begin
Problem- Give a value for each letter alphabet (organized into sets of different values)
       - Calculate the overal score of a given word.
Example- "cabbage" results in a score of 14 points
Data structure- Take a string
              - Create a hash with the letters as the values and point value as the keys
              -return an integer
Approach- 1. Create a hash
            -Keys = point values
            -Values = array of letters
          2. Create variable to keep tally of the sum
          3. Iterate through the given string
            -Increment the sum variable by the key of given value array the current iteration falls into
          4. return the sum 
Code
=end
class Scrabble
  POINTS_AND_LETTERS = {
                        1 =>  ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
                        2 =>  ["D", "G"],
                        3 =>  ["B", "C", "M", "P"],
                        4 =>  ["F", "H", "V", "W", "Y"],
                        5 =>  ["K"],
                        8 =>  ["J", "X"],
                        10 => ["Q", "Z"]
                        }

  def self.score(word)
    return 0 if word.nil?

    resulting_sum = 0

    word.chars.each do |letter|
      POINTS_AND_LETTERS.each do |key, value_arr|
        if value_arr.include?(letter.upcase)
          resulting_sum += POINTS_AND_LETTERS.key(value_arr)
        end
      end
    end

    resulting_sum
  end

  def initialize(str)
    @str = str
  end

  def score
    self.class.score(@str)
  end
end
