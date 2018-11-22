# Represents a card randomly drawn from a standard tarot deck, chosen during initialization.
#
# Author: Alexia Christie

class Card

  #Constants related to the structure of a deck
  TOTAL_CARDS = 78
  MINOR_ARCANA = 56
  SUIT_SIZE = 14
  NUM_SUITS = 4
  #Constants related to the location of specific cards
  ACE = 1
  PAGE = 11
  KNIGHT = 12
  QUEEN = 13
  KING = 14

  #Each card has a number and either a suit or a name
  attr_accessor :number, :suit, :name

  #Creates a new card, drawn randomly from the deck.
  def initialize
    card = rand(TOTAL_CARDS)
    if card > MINOR_ARCANA
      pick_major(card-MINOR_ARCANA - 1)
    else
      pick_minor(card)
    end
  end

  #Draws a minor arcana card
  # card: card number
  def pick_minor(card)
    @number = (card % SUIT_SIZE) + 1
    #Name ace and court cards
    if @number == ACE
      @number = 'Ace'
    elsif @number == PAGE
      @number = 'Page'
    elsif @number == KNIGHT
      @number = 'Knight'
    elsif @number == QUEEN
      @number = 'Queen'
    elsif @number == KING
      @number = 'King'
    end

    #Name the suit
    case (card % NUM_SUITS)
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

  #Draws a major arcana card
  # card: the major arcana number of the card
  def pick_major(card)
    #The names of each Major arcana card, in the correct order
    names = ['The Fool', 'The Magician', 'The High Priestess', 'The Empress', 'The Emperor', 'The Hierophant',
      'The Lovers', 'The Chariot', 'Strength', 'The Hermit', 'The Wheel of Fortune', 'Justice', 'The Hanged Man',
      'Death', 'Temperance', 'The Devil', 'The Tower', 'The Star', 'The Moon', 'The Sun', 'Judgement', 'The World']
    @number = card
    @name = names[card]
    @suit = 'major'
  end
end