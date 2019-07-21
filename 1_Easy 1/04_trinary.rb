class Trinary
  attr_reader :input

  BASE = 3

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
    @arr.each_with_index.map{|num, idx| num * BASE ** idx}.sum
  end

  def to_decimal
    convert_to_arr()
    reverse_arr()
    convert_to_base10()
  end
end

tri = Trinary.new('102012')
p tri.to_decimal