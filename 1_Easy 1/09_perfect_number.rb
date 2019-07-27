=begin
Problem - Tell whether a number is perfect, abundant or deficient based on the sum its factors
        - perfect is sum of factors == number, abundant if sum of factors is greater and vice-versa
Example - 12 is abundant because 1+2+3+4+6 = 16 is greater than 12
        - 6 is perfect because 1 + 2 + 3 = 6
        - primes numbers such as 7, 13, etc are deficient
Data structure - take an integer, create a array of factors and return a string
Approach - 1. Take a integer
           2. Create an array from range 1...integer
              -keep the numbers that the integer is easily divisble by
          3. Compare the sum of the array
            - If it's the same as the integer return the string perfect
            - If more return 'abundant'
            -else return 'deficient'
Code
=end

class PerfectNumber
  def self.create_array(endpoint)
    @arr = (1...endpoint).to_a
  end

  def self.keep_factors(int)
    @arr.keep_if{|num| int % num == 0}
  end

  def self.classify(int)
    raise RuntimeError unless int.positive?

    create_array(int)
    keep_factors(int)

    case @arr.sum
    when 0...int then 'deficient'
    when int     then 'perfect'
    else
      'abundant'
    end
  end
end

pn = PerfectNumber.new
#p pn.create_array(12)
#p pn.keep_factors(12)

#p pn.classify(13)