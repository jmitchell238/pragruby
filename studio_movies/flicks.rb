require_relative 'playlist'
# require_relative 'movie3d'

movie1 = Movie.new('goonies', 10)
movie2 = Movie.new('ghostbusters', 9)
movie3 = Movie.new('goldfinger')

playlist = Flicks::Playlist.new('Kermit')
playlist.add_movie(movie1)
playlist.add_movie(movie2)
playlist.add_movie(movie3)
# playlist.load(ARGV.shift || "movies.csv")
# movie3d = Movie3D.new('glee', 5, 20)
# playlist.add_movie(movie3d)

loop do
  puts "How many viewings? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    playlist.play(answer.to_i)
  when 'quit', 'exit'
    playlist.print_stats
    break
  else
    puts "Please enter a number or 'quit'."
  end
end

playlist.save