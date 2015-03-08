# Step 3 -
# - Open irb and let's play with strings:
# Refer to http://ruby-doc.org/core-2.2.0/String.html
# What can we as a string?
#   try this:
#     "HELLO".downcase
#     "hello".upcase
#   mystring = "hello"
#   mystring.length
#   mystring.upcase
#   mystring << " world"
#   mysentence = "get key"
#   mysentence.split('')
# - Allow someone to type H or h (use downcase)
# - Add Commands: look, get, open
# To run: ruby room_escape_3.rb

def print_welcome
  puts "<><><> Welcome to the Very Spooky Room <><><>"
  print "Try to escape..."
  print "If you dare!"
  puts
end

def print_instructions
  puts "I understand these commands:"
  puts "get <object> - Use to get an item, like 'get key'"
  puts "open <object> - Use to open something, like a door 'open door'"
  puts "l - Look around"
  puts "h - Print these instructions"
  puts "q - Quit"
end

def look
  puts "You look around the room that confines you."
  puts "You see cobwebs covering the walls, and an open trunk in the corner."
  puts "In the trunk you see a shiny key. On one wall you see a closed door."
  puts "You hear strange growling sounds."
end

def end_game
  abort("Leaving so soon?")
end

def get_command(input)
  words = input.split(' ')
  target = words[1]
  puts "Getting #{target}"
end

def open_command(input)
  words = input.split(' ')
  target = words[1]
  puts "Opening #{target}"
end

def prompt
  print "Command? > "
  input = gets.chomp.downcase
#  puts "You said #{input}"
  # if input == "h"
  #    print_instructions
  # elsif input == "q"
  #   end_game
  # elsif (input == "l" || input == "look")
  #   look
  # elsif input.match(/get/)
  #   get_command(input)
  # else
  #   puts "What??"
  # end

  case input
  when /^h/
    print_instructions
  when /^q/
    end_game
  when /^l/
    look
  when /get/
    get_command(input)
  when /open/
    open_command(input)
  else
    puts "What??"
  end
  prompt
end

print_welcome
print_instructions
prompt



