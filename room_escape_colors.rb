# let's add some color!
# On mac or linux:
#  gem install colorize

# test it out in irb:
# └─[$] irb                                                                                                             [16:24:00]
# irb(main):001:0> require 'colorize'
# => true
# irb(main):002:0> String.colors
# => [:black, :light_black, :red, :light_red, :green, :light_green, :yellow, :light_yellow, :blue, :light_blue, :magenta, :light_magenta, :cyan, :light_cyan, :white, :light_white, :default]
# irb(main):003:0> String.modes
# => [:default, :bold, :underline, :blink, :swap, :hide]

# We need to use the library
require 'colorize'

@inventory = []
@things_to_get = [ "key" ]

def start_game
  print_welcome
  print_instructions
  prompt
end

def print_welcome
  puts "<><><><><><><><><><><><><><><><><><><><><><><>".yellow
  puts "<><><> Welcome to the Super Spooky Room <><><>".yellow
  print "Try to escape...If you dare!".yellow
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
    prompt
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
    prompt
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
  puts " The door opens ... to reveal a fierce zombie!".red
  puts " The zombie bites you, and you are turned into a zombie!".red.blink
  puts " Better luck next time!".yellow
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
  prompt
end

start_game