# Step 2 - 
#  - Encapsulate the welcome in a method
#  - Print instructions
#  - Ask for next move
# To run: ruby room_escape_2.rb

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

def prompt
  print "Command? > "
  input = gets.chomp
  prompt
end

print_welcome
print_instructions
prompt



