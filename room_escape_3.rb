# Step 3 - 
# - Commands
# To run: ruby room_escape_3.rb

def print_welcome
  puts "Welcome to the Very Spooky Room."
  print "Try to escape..."
  print "If you dare!"
  puts
end

def print_instructions
  puts "h - Print these instructions"
  puts "m - Move"
  puts "q - Quit"
end

def end_game
  puts "Leaving so soon?"
end

def move
  puts "Move 1"
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
  else
    puts "What??"
    prompt
  end
end

print_welcome
print_instructions
prompt



