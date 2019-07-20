=begin
Problem - Take a base8 (octal) number and convert it to base10 (decimal)
Example - 155 -> 233
Data structure - Convert string to array
Algorithm/approach -
1. Given a string
  -convert it to an integer
2. Validate that it's a valid base8 number
  -convert it to an array
  -make sure no element is greater is than 8
  -if it is return 0
3. Iterate through the array
  -take the current iteration
  -multiple it by 8
  -exponentiate it to the current index (zero-based index)
. Return the result
Code
=end

class Octal
  attr_reader :input

  def initialize(input)
    @input = input
    @arr = []
  end

  def convert_to_arr
    @arr = input.chars.map{|str| str.to_i}
  end

  def reverse_arr
    @arr.reverse!
  end

  def convert_to_base10
    result = @arr.each_with_object([]) do |item, arr|
      arr << item * 8 ** (@arr.index(item))
    end
    result.sum()
  end

  def to_decimal
    convert_to_arr()
    reverse_arr()
    convert_to_base10()
  end
end

carrot = Octal.new('carrot')
p carrot.to_decimal

octal = Octal.new('1234567')
p octal.to_decimal
