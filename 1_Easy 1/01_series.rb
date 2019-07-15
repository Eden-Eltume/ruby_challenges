class Series
  attr_accessor :str

  def initialize(str)
    @str = str
  end

  def slices(n)
    arr_digits = str.chars.map{|char| char.to_i }
    raise ArgumentError, 'n is too big for the string.' if n > arr_digits.size

    new_arr = []
    str.length.times do |i|
      section = arr_digits[i...i+n]
      new_arr << section unless section.size != n
    end
    new_arr
  end
end

test = Series.new("9123")
p test.slices(2)