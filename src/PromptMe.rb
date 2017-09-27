# Uses a file containing established stories and characters to generate prompts.
# Author- Alexia Christie
#
# Recreation of project originally created in Python.

# Story has a name and array of associated characters.
Story = Struct.new(:name, :characters)

# Gives prompt related to the relationship between characters.
#
# universes: array of Universes
def relationship(stories)

  case rand(2)
    when 0
      time = 'early'
    when 1
      time = 'developing'
    else
      time = 'ultimate'
  end
  # Choose a story and two characters from it.
  story_num = rand(stories.length - 1)
  story_pick = stories[story_num]
  story_name = story_pick.name
  character_num = rand(story_pick.characters.length - 1)
  character_pick = story_pick.characters[character_num]
  friend_num = rand(story_pick.characters.length - 1)
  friend_pick = story_pick.characters[friend_num]

  if character_pick == friend_pick
    puts('Write about ' + character_pick + ' from ' + story_name + ' and their ' + time +
             ' relationship with themselves.')
  else
    puts('Write about ' + character_pick + ' from ' + story_name + ' and their ' + time +
           ' relationship with ' + friend_pick + '.')
  end
end

def main
  puts('Enter filename:')
  filename = gets.chomp
  stories = []

  # Open the file, with each line formatted as such:
  # Story Name, Character 1, Character 2 ...
  File.open(filename, 'rb').each do |line|
    name, *chars = line.split(', ')
    # Remove newline character from the last name
    chars[chars.length - 1] = chars[chars.length - 1].strip
    example = Story.new(name, chars)
    stories.insert(0, example)
  end

  relationship(stories)
end

main