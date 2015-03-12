# Step 4
#  - Let's do something with the key and the door
#  - Let's throw in a random monster
#  - Do you want other puzzles in your room?
#  - Do you want to fight a monster?

# [] is an array or a list of things. in this
# case we'll be storing the names of the things.
@inventory = []
@things_to_get = [ "key" ]

def start_game
  print_welcome
  print_instructions
  loop do
    prompt
  end
end

def print_welcome
  puts "<><><><><><><><><><><><><><><><><><><><><><><>"
  puts "<><><> Welcome to the Super Spooky Room <><><>"
  print "Try to escape...If you dare!"
  puts
end

def print_instructions
  puts " I understand these commands:"
  puts "  get <object>  - Use to get an item, like 'get key'"
  puts "  open <object> - Use to open something, like a door 'open door'"
  puts "  l - Look around"
  puts "  h - Print these instructions"
  puts "  q - Quit"
end

def look
  puts ""
  puts " You look around the room that confines you."
  puts " You see cobwebs covering the walls, and an open trunk in the corner."
  puts " In the trunk you see a shiny key. On one wall you see a closed door."
  puts " You hear strange growling sounds."
  puts ""
end

def end_game
  puts " Leaving so soon?"
  puts
  exit
end

def get_command(input)
  words = input.split(' ')
  if words.length < 2
    puts " What do you want to get?"
  else
    target = words[1]
    if @inventory.include?(target)
      puts " You're already carrying a #{target}."
    elsif @things_to_get.include?(target)
      @inventory << target
      puts " You are now carrying: #{@inventory.inspect}"
    else
      puts " #{target.capitalize}? Where do you see that?"
    end
  end
end

def open_command(input)
  words = input.split(' ')
  if words.length < 2
    puts " What do you want to open?"
  else
    target = words[1]
    if target.downcase == "door" && @inventory.include?("key")
      puts " Opening #{target}"
      if monster
        monster_attack
      else
        escape
      end
    elsif target.downcase == "door" && !@inventory.include?("key")
      puts " You need a key for that!"
    else
      puts " With what, your bare hands?"
    end
  end
end

def monster
  number = rand(10)
  #puts "#{number}"
  number > 5
end

def monster_attack
  puts " The door opens ... to reveal a fierce zombie!"
  puts " The zombie bites you, and you are turned into a zombie!"
  puts " Better luck next time!"
  puts ""
  exit
end

def escape
  puts " You have escaped!"
  puts ""
  exit
end

def prompt
  print "Command? > "
  input = gets.chomp.downcase
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
end

start_game
