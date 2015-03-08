#
# get key
# open door
# Ruby pattern matching - I'll provide a function to look at two words:
# command[space]object

# Design your rooms.
#  Start in one room.
# 
#  How can someone escape?
#  Let's put a key in one place, and a door in another.
#  Look - describe the room
#  Get Key - get key
#  Open door - open door
#  Random Dragon that eats you
#

def print_welcome
  puts "Welcome to the Very Spooky Room."
  print "Try to escape..."
  print "If you dare!"
  puts
end

def print_instructions
  puts "h - Print these instructions"
  puts "n - Move north"
  puts "s - Move south"
  puts "e - Move east"
  puts "q - Quit"
end

def end_game
  puts "Leaving so soon?"
end

def move
  puts "Move 1"
end

# Detailed description of the room
def look
end

def prompt
  print "Command? > "
  input = gets.chomp.downcase
  case input
  when "h"
    print_instructions
    prompt
  when "q"
    end_game
  when "m"
    move
    prompt
  when input.match(/get/)
    get(input)
  when input.match(/open/)
    open(input)
  else
    puts "What??"
    prompt
  end
end

print_welcome
print_instructions
prompt

