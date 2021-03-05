require_relative 'lib/movie'

# file = File.open("movies.csv")
# # read file
# file.close

# File.open("movies.csv") do |file|
#   #read movies
#   file.each_line do |line|
#     puts line
#   end
# end

# File.readlines("movies.csv").each do |line|
#   title, rank = line.split(',')
#   movie = Movie.new(title, rank.to_i)
#   puts movie
# end

movie1 = Flicks::Movie.new("goonies", 10)
movie2 = Flicks::Movie.new("ghostbusters", 9)
movie3 = Flicks::Movie.new("goldfinger")

movies = [movie1, movie2, movie3]
default_movie_file = File.join(File.dirname(__FILE__), 'movie_rankings.csv')

File.open(default_movie_file, "w") do |file|
  movies.sort.each do |movie|
    file.puts "#{movie.title},#{movie.rank}"
  end
end

