require_relative 'lib/flicks/movie'

movie = Movie.new('godfather', 9)

if movie.rank >= 10
  puts "Hit"
else
  puts "Flop"
end

puts "Hit" if movie.rank >= 10

