class Card
  TOTAL_CARDS = 78
  MINOR_ARCANA = 56
  SUIT_SIZE = 14
  NUM_SUITS = 4
  attr_accessor :number, :suit, :name

  def draw
    card = rand(TOTAL_CARDS)
    if card > MINOR_ARCANA
      pick_major(card-MINOR_ARCANA - 1)
    else
      pick_minor(card)
    end
  end

  def pick_minor(card)
    @number = (card % SUIT_SIZE) + 1
    #Name ace and court cards
    if @number == 1
      @number = 'Ace'
    elsif @number == 11
      @number = 'Page'
    elsif @number == 12
      @number = 'Knight'
    elsif @number == 13
      @number = 'Queen'
    elsif @number == 14
      @number = 'King'
    end
    #Name the suit
    case (card / NUM_SUITS)
      when 0
        @suit = 'Swords'
      when 1
        @suit = 'Cups'
      when 2
        @suit = 'Pentacles'
      else
        @suit = 'Wands'
    end
  end

  def pick_major(card)
    @number = card
    names = ['The Fool', 'The Magician', 'The High Priestess', 'The Empress', 'The Emperor', 'The Hierophant',
      'The Lovers', 'The Chariot', 'Strength', 'The Hermit', 'The Wheel of Fortune', 'Justice', 'The Hanged Man',
      'Death', 'Temperance', 'The Devil', 'The Tower', 'The Star', 'The Moon', 'The Sun', 'Judgement', 'The World']
    @name = names[card]
    @suit = 'major'
  end
end