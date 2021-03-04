require_relative 'my_enumerable'

class Song
  attr_reader :name, :artist, :duration

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end

  def play
    puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
  end

  def each_filename
    basename = "#{@name}-#{@artist}".gsub(" ", "-").downcase
    extensions = [".mp3", ".wav", ".acc"]
    extensions.each { |ext| yield basename + ext }
  end
end

song1 = Song.new("Okie From Muskogee", "Merle", 5)
song2 = Song.new("Ramblin' Man", "Hank", 7)
song3 = Song.new("Good Hearted Woman", "Waylon", 6)

song1.each_filename { |filename| puts filename }
song2.each_filename { |filename| puts filename }
song3.each_filename { |filename| puts filename }


class Playlist
  # include Enumerable
  include MyEnumerable

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def each(&block)
    @songs.each(&block)
    # @songs.each { |song| yield song }
  end

  def each_tagline
    each { |song| yield "#{song.name} - #{song.artist}" }
  end

  def each_by_artist(artist, &block)
    # select { |song| song.artist == artist }.each { |song| yield song }
    my_select { |song| song.artist == artist }.each(&block)
  end

  def play_songs
    each(&:play)
  end
end

playlist = Playlist.new("Country/Western, Y'all!")
playlist.add_song(song1)
playlist.add_song(song2)
playlist.add_song(song3)

# playlist.each { |song| song.play }

# playlist.play_songs
#
# playlist.each_tagline { |tagline| puts tagline }

# playlist.each_by_artist("Hank") { |song| song.play }
# playlist.each_by_artist("Waylon") { |song| song.play }
# playlist.each_by_artist("Hank", &:play)
# playlist.each_by_artist("Waylon", &:play)






okie_songs = playlist.my_select { |song| song.name =~ /Okie/ }
p okie_songs

non_okie_songs = playlist.my_reject { |song| song.name =~ /Okie/ }
p non_okie_songs

# hank_songs = playlist.select { |song| song.artist =~ /Hank/ }.map { |song| "#{song.name} - By: #{song.artist}"}
# p hank_songs

p playlist.my_any? { |song| song.artist == "Hank" }
p playlist.my_detect { |song| song.artist == "Hank" }
#
song_labels = playlist.my_map { |song| "#{song.name} - By: #{song.artist}" }
p song_labels
#
total_duration = playlist.my_reduce(0) { |sum, song| sum + song.duration }
p total_duration