require_relative 'lib/flicks/movie'

movie1 = Flicks::Movie.new('goonies', 10)
movie2 = Flicks::Movie.new('godfather', 3)
movie3 = Flicks::Movie.new('goldfinger', 10)

movies = [movie1, movie2, movie3]

puts movies.sort

