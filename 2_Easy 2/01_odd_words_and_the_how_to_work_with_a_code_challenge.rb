=begin
Problem - Given a string return a string with the first word of the input string intact
          and each successive odd number word in the string reversed.
          -Each word is 1-20 letters
          -An input string cosists of 1+ words seaprated from each by 1+ spaces
          -An input string is terminated with a period.
Example - "whats the matter with kansas"
        - becomes "whats eht matter htiw kansas"
Data structure - take a string, convert to array and back to a string
Approach -1. Take input string
          2. Remove non alphabetical letters and any character that's not a space or .
            -gsub and regex?
          3. Eliminate extraneous spaces
          4. Split the altered string into a array of strings
             -separate each element by a space
          5. Iterate through the array
            -as you iterate reverse the string elements with odd index
          6. join the array back into a string and return that
Code
=end

class OddWords
  def initialize(input_string)
    @input_string = input_string
    @output_string = ''
  end

  def remove_ineligible_chars
    @input_string.gsub!(/[^a-z A-Z.]/, '')
  end

  def remove_extraneous_spaces
    @input_string.gsub!(/ {2}/, ' ')
  end

  def modify_odds
    input_array = @input_string.split
    input_array.each_with_index do |word, idx|
      if idx.odd? && input_array.size == 2
        word.delete!(".")
        @output_string << word.reverse + "."
      elsif idx.odd? && word.end_with?(".")
        @output_string << word.delete("") + " "
      elsif idx.odd?
        @output_string << word.reverse + " "
      else
        @output_string << word + " "
      end
    end
    @output_string.gsub(" .", '.').gsub(" . ", '.').gsub(". ", '.')
  end

  def return_result
    remove_ineligible_chars() if @input_string.length > 1
    remove_extraneous_spaces()
    modify_odds()
  end  
end

p OddWords.new('this.').return_result == 'this.'
p OddWords.new('this  .').return_result == 'this.'
p OddWords.new('this day.').return_result == 'this yad.'
p OddWords.new('this Town has two drivers .').return_result == 'this nwoT has owt drivers.'
p OddWords.new('whats   the matter  with kansas  today .').return_result == 'whats eht matter htiw kansas yadot.'
p OddWords.new('a  b    c   d e  .').return_result == 'a b c d e.'