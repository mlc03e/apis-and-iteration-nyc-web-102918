
#!/usr/bin/env ruby
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
welcome
character = get_character_from_user
show_character_movies(character)
# welcome
# title = get_movie_title_from_user
# movie_by_name(title)
