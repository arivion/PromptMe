# Uses a file containing established stories and characters to generate prompts.
# Author- Alexia Christie
#
# Recreation of project originally created in Python.

# Story has a name and array of associated characters.

Story = Struct.new(:name, :characters)

# Picks a random story and two characters from it.
#
# stories: array of stories
#
# return: array with [story name, character 1, character 2]
def pick(stories)

  # Choose a story and two characters from it.
  story_num = rand(stories.length)
  story_pick = stories[story_num]
  story_name = story_pick.name

  character_num = rand(story_pick.characters.length)
  character_pick = story_pick.characters[character_num]

  friend_num = rand(story_pick.characters.length)
  friend_pick = story_pick.characters[friend_num]

  return [story_name, character_pick, friend_pick]
end


#Gives prompt related to the plot of the story.
def plot(story, character)

  case rand(3)
    when 1
      time = 'expository'
    when 2
      time = 'climactic'
    else
      time = 'resolving'
  end

  puts('Write about an important ' + time + ' event in ' + story +  ' that involved ' + character + '.')
end


# Gives prompt related to the relationship between characters.
def relationship(story, character, friend)

  case rand(3)
    when 1
      time = 'early'
    when 2
      time = 'developing'
    else
      time = 'ultimate'
  end

  if character == friend
    puts('Write about ' + character + ' from ' + story + ' and their ' + time +
             ' self-image.')
  else
    puts('Write about the ' + time + ' relationship between ' + character +  ' and ' + friend + ' from ' + story + '.')
  end
end

def main
  stories = []
  puts('Enter filename:')
 # filename = gets.chomp

  # Open the file, with each line formatted as such:
  # Story Name, Character 1, Character 2 ...
  File.open('example.txt', 'rb').each do |line|
    name, *chars = line.split(', ')
    # Remove newline character from the last name
    chars[chars.length - 1] = chars[chars.length - 1].strip
    example = Story.new(name, chars)
    stories.insert(0, example)
  end

  choice = pick(stories)
  case rand(2)
    when 1
      relationship(choice[0], choice[1], choice[2])
    else
      plot(choice[0], choice[1])
  end

end

main