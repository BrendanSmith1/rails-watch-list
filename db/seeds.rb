# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

puts 'Destroying all entries'
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

require "json"
require "open-uri"

url = "http://tmdb.lewagon.com/movie/top_rated?api_key=<your_api_key>"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

poster_base_url = "https://image.tmdb.org/t/p/w500"

movies["results"].first(20).each do |movie|
  Movie.create!(title: movie["title"], overview: movie["overview"], poster_url: poster_base_url + movie["poster_path"], rating: movie["vote_average"])
end

puts '5 Movies created'

List.create!(name: 'Drama')
List.create!(name: 'Action')
List.create!(name: 'Classics')
List.create!(name: 'Sci-Fi')
List.create!(name: 'Reality TV')
List.create!(name: 'RomCom')
List.create!(name: 'Personal Favourites')

puts 'Lists created'

# all_movies = Movie.all
# all_movies.each_with_index do |movie|
#   Bookmark.create!(comment: "Great List #{}", movie: movie, list: List.first)
# end

# puts 'Bookmarks created'

require "open-uri"

file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
list = List.new(name: 'test')
list.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
list.save
