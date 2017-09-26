Universe = Struct.new(:name, :characters)

def main
  puts('Enter filename:')
  filename = gets.chomp
  universes = []

  File.open(filename, 'rb').each do |line|
    name, *chars = line.split(', ')
    chars[chars.length - 1] = chars[chars.length - 1].strip
    example = Universe.new(name, chars)
    universes.insert(0, example)
    puts universes[0].name
    puts universes[0].characters.inspect
  end

end

main