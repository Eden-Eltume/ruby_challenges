class Beer
  attr_reader :initial_beer_count

  def initialize(initial_beer_count)
    @initial_beer_count = initial_beer_count
  end

  def to_s
    "#{initial_beer_count}"
  end
end

class BeerSong
  def self.sing(start=99, finish=0)
     beer = Beer.new(start)

     whole_song = []

    beer.initial_beer_count.downto(finish) do |beer_count|
      case beer_count
        when 2
          whole_song << 
          "#{beer_count} bottles of beer on the wall, #{beer_count} bottles of beer.\n" +
          "Take one down and pass it around, 1 bottle of beer on the wall.\n"
        when 1
          whole_song <<
          "#{beer_count} bottle of beer on the wall, #{beer_count} bottle of beer.\n" +
          "Take it down and pass it around, no more bottles of beer on the wall.\n"
        when 0
          whole_song <<
          "No more bottles of beer on the wall, no more bottles of beer.\n" +
          "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
        else
          whole_song <<
          "#{beer_count} bottles of beer on the wall, #{beer_count} bottles of beer.\n" +
          "Take one down and pass it around, #{beer_count - 1} bottles of beer on the wall.\n"
      end
    end
    whole_song.join("\n")
  end

  def verses(start, finish)
    self.class.sing(start, finish)
  end

  def verse(start)
    self.class.sing(start, start)
  end

  def lyrics
    self.class.sing
  end
end
