# Step 2 - 
#  - Encapsulate the welcome in a method
#  - Print instructions
#  - Commands h, q
#
# To run: ruby room_escape_2.rb

def print_welcome
  puts "Welcome to the Very Spooky Room."
  print "Try to escape..."
  print "If you dare!"
  puts
end

def print_instructions
  puts "h - Print these instructions"
  puts "q - Quit"
end

# We are storing the input in a variable then printing it out.
def prompt
  print "Command? > "
  input = gets.chomp
  puts "You said: #{input}"
  prompt
end

print_welcome
print_instructions
prompt



