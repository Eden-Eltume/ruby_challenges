=begin
Probelm - given a number as a endpoint 
        - and also a set of numbers, if none it defaults to 3 or 5
        - write a prgram that gives you the multiples of that set of number up to the endpoint (exclusive)
        - return the sum of the multiples 
Example - endpoint = 20, multiples_of = 3 or 5
        - result = [3,5,6,9,10,12,15,18] which sums up to 78
Data structure - create an array of integers
Approach -
          1. Identify the endpoint and set of numbers your luck for multiples of
            -endpoint = to
            -set of numbers = *args which defaults to 3,5
          2. create a new array
          3. iterate over endpoint
            -add every number that is evenly divisble by the numbers in the set of numbers
            -use double loop?
          4. return the sum of the new array without duplicates 
Code
=end

class SumOfMultiples
  def initialize(*args)
    @factors = *args
    @multiples = []
  end

  def to(endpoint)
    min_factor = @factors.min
    arr = (min_factor...endpoint).to_a
    arr.each do |num|
      @factors.each{|factor| @multiples << num if num % factor == 0}
    end
    @multiples.uniq.sum
  end

  def self.to(limit)
    new(3, 5).to(limit)
  end
end

sum = SumOfMultiples.new(4, 6)
p sum.to(15)

puts ""

p SumOfMultiples.to(10)