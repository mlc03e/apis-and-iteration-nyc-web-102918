require 'rest-client'
require 'json'
require 'pry'
def get_character_information(character)
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  found_character = response_hash['results'].find do |character_hash|
    character_hash["name"] == character
  end
end
def get_character_movies(character)
  found_character = get_character_information(character)
  films_array = found_character["films"].map do |film_url|
    response_string = RestClient.get(film_url)
    films_hash = JSON.parse(response_string)
  end
  films_array
end
  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
def print_movies(films_array)
  # some iteration magic and puts out the movies in a nice list
  films_array.each do |films_hash|
    puts "#{films_hash["episode_id"]} #{films_hash["title"]}"
  end
end
def show_character_movies(character)
  films_array = get_character_movies(character)
  print_movies(films_array)
end
## BONUS
# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
def movie_by_name(title)
  response_string = RestClient.get('http://www.swapi.co/api/films/')
  response_hash = JSON.parse(response_string)
  found_movie = response_hash['results'].find do |movie_hash|
    movie_hash['title'] == title
  end
  puts found_movie['characters']
end
