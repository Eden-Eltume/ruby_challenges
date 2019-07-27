=begin
Problem - Count the number of occurrences of a word in a given text
        - Alphabet and apostrophe only
Example - phrase = Phrase.new('car : carpet's as java : javascript!!&@$%^&')
    counts = {
      'car' => 1, 'carpet's => 1, 'as' => 1,
      'java' => 1, 'javascript' => 1
    }
Data structure -  take a string and return a hash
Approach -
         1- Given a string remove all non alphabetical or apostrophe characters
          -has to be case insensitive
        2. Split the modified string into an array delimited by space
        3. Create a an empty array to be returned
        4. Loop through the given phrase string
          - set the current iteration as the key
          - and set the value as the number of times the key appears in the phrase
        5. return the hash
Code
=end

class Phrase
  attr_accessor :text

  def initialize(text)
    @text = text.downcase.scan(/[a-z]+'?[a-z]+|\d+/)
  end

  def word_count
    text.each_with_object(Hash.new(0)) do |word, results|
      results[word] += 1
    end
  end
end

phrase = Phrase.new("Hi I'm Hi EDEN!")
p phrase.word_count