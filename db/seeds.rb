
require 'json'
require 'open-uri'

puts 'destroying all movies...'

Movie.delete_all

puts 'adding new movies...'

url = 'http://tmdb.lewagon.com/movie/top_rated'
movie_serialized = URI.open(url).read
movie_hash = JSON.parse(movie_serialized)
movie_array = movie_hash["results"]
top_10_movies = movie_array.first(10)
# top_movies = []
# top_movies << top_10_array

top_10_movies.each do |movie|
  Movie.create!(
    title: movie["title"],
    overview: movie["overview"],
    rating: movie["vote_average"],
    poster_url: "#{url}#{movie["poster_path"]}"
  )
end

# p top_10_movies

puts 'seeding done!'
