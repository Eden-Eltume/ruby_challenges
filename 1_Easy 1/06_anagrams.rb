class Anagram
  attr_reader :word, :letters

  def initialize(word)
    @word = word.downcase
    @letters = @word.chars.sort
  end

  def sorted_letters(str)
    str.downcase.chars.sort
  end

  def match(word_array)
    word_array.select { |ana| sorted_letters(ana) == letters && ana.downcase != word }
  end
end

detector = Anagram.new('ant')
anagrams = detector.match(%w(Tan Stand at))

p anagrams