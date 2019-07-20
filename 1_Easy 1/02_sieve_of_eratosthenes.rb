class Sieve
  attr_reader :last_number
  attr_accessor :list, :current_number

  def initialize(last_number)
    @last_number = last_number
    @list = []
    @current_number = 2
    @stop = false
  end

  def generate_initial_ints
    2.upto(last_number - 1){|current_num| self.list << current_num }
  end

  def find_non_multiples
    @non_multiples = list.select do |current_num|
      current_num % current_number != 0
    end
  end

  def remove_non_multiples
    self.list = list & @non_multiples.unshift(current_number)
  end

  def find_next_current_number
    index_of_current_number = list.index(current_number)
    if current_number ** 2 > list.last
      @stop = true
    else 
      self.current_number = list[index_of_current_number + 1]
    end
  end

  def primes
    generate_initial_ints()
    loop do
      break if @stop
      find_non_multiples()
      remove_non_multiples
      find_next_current_number
    end
    list
  end

  def to_s
    "Iterated over orignal array #{(2..30).to_a} \n" +
    "Stopped at #{current_number} to find all primes #{list}"
  end
end

sieve = Sieve.new(30)
sieve.primes
puts sieve