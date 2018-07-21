# Uses a file containing established stories and characters to generate prompts.
#
# Author: Alexia Christie

require_relative 'card'

# Story has a name and array of associated characters.
Story = Struct.new(:name, :characters)
Pick = Struct.new(:story_name, :characters)

# Picks a random story and two characters from it.
# stories: an array of Story objects
# return: a Pick object
def pick(stories)
  # Choose a story and two characters from it.
  story_num = rand(stories.length)
  story_pick = stories[story_num]
  story_name = story_pick.name

  character_num = rand(story_pick.characters.length)
  character_pick = story_pick.characters[character_num]

  friend_num = rand(story_pick.characters.length)
  friend_pick = story_pick.characters[friend_num]

  Pick.new(story_name, [character_pick, friend_pick])
end


#Gives prompt related to the plot of the story.
def plot(pick)
  case rand(3)
    when 1
      time = 'expository'
    when 2
      time = 'climactic'
    else
      time = 'resolving'
  end
  #Output
  puts("Write about an important #{time} event in #{pick[:story_name]} that involved #{pick[:characters][0]}.")
end


#Gives prompt related to the relationship between characters.
def relationship(pick)
  case rand(3)
    when 1
      time = 'early'
    when 2
      time = 'developing'
    else
      time = 'ultimate'
  end
  #Output
  if pick[:characters][0] == pick[:characters][1]
    puts("Write about #{pick[:characters[0]]} from #{pick[:story_name]} and their #{time} self-image.")
  else
    puts("Write about the #{time} relationship between #{pick[:characters][0]} and #{pick[:characters][1]} from #{pick[:story_name]}.")
  end
end

#Gives prompt related to a character's past
def past(pick)
  case rand(2)
    when 1
      mem = 'a pleasant'
    else
      mem = 'an unpleasant'
  end
  #Output
  puts("Write about #{mem} memory of #{pick[:characters][0]} in #{pick[:story_name]}.")
end

#Gives prompt related to a character's future
def future(pick)
  case rand(3)
    when 1
      puts("How and when does #{pick[:characters][0]} from #{pick[:story_name]} die?")
    when 2
      puts("What does #{pick[:characters][0]} from #{pick[:story_name]} do after the events of the story?")
    else
      if pick[:characters][0] == pick[:characters][1]
        puts("What does #{pick[:characters][0]} from #{pick[:story_name]} do after the events of the story?")
      else
        puts("What happens between #{pick[:characters][0]} and #{pick[:characters][1]} from #{pick[:story_name]} after the events of the story?")
      end
  end
end

#Main function
def main
  stories = []
  # Open the file stories.txt, with each line formatted as such:
  # Story Name: Character 1, Character 2 ...
  File.open('stories.txt', 'rb').each do |line|
    name, char_list = line.split(': ')
    *chars = char_list.split(', ')
    # Remove newline character from the last name
    chars[chars.length - 1] = chars[chars.length - 1].strip
    example = Story.new(name, chars)
    stories.insert(0, example)
  end
  #At this point, each category has equal weight as they each have the same number of branches
  choice = pick(stories)
  case rand(4)
    when 1
      relationship(choice)
    when 2
      past(choice)
    when 3
      plot(choice)
    else
      future(choice)
  end
  #Add additional inspiration
  inspiration = Card.new
  if inspiration.suit == 'major'
    puts("Tarot Card: #{inspiration.name} (##{inspiration.number})")
  else
    puts("Tarot Card: The #{inspiration.number} of #{inspiration.suit}")
  end
end

main