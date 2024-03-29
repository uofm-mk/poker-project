# hand.rb

require_relative 'card'
require_relative 'deck'

class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def evaluate
    return :four_of_a_kind if four_of_a_kind?
    return :full_house if full_house?
    return :flush if flush?
    return :straight if straight?
    return :three_of_a_kind if three_of_a_kind?
    return :two_pair if two_pair?
    return :pair if pair?
    :high_card

  end

  private

  def values
    @cards.map { |card| card.value }
  end

  def suits
    @cards.map { |card| card.suit }
  end

  def count_values
    values.group_by(&:itself).transform_values(&:count)
  end

  def straight?
    sorted_values = values.map { |value| value.to_i }.sort
    sorted_values.each_cons(2).all? { |a, b| b == a + 1 } || sorted_values == [2, 3, 4, 5, 14]  # Handle Ace-low straight
  end

  def flush?
    suits.uniq.length == 1
  end

  def four_of_a_kind?
    count_values.values.include?(4)
  end

  def full_house?
    count_values.values.include?(3) && count_values.values.include?(2)
  end

  def three_of_a_kind?
    count_values.values.include?(3)
  end

  def two_pair?
    count_values.values.count(2) == 2
  end

  def pair?
    count_values.values.include?(2)
  end
end
