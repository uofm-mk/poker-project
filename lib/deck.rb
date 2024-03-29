require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    create_deck
    shuffle
  end

  def create_deck
    suits = %w[Hearts Diamonds Clubs Spades]
    values = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]

    suits.each do |suit|
      values.each do |value|
        @cards << Card.new(suit, value)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def deal(num)
    @cards.pop(num)
  end
end
