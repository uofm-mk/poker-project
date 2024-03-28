# spec/deck_spec.rb
require_relative '../classes/deck'

RSpec.describe Deck do
  describe "#initialize" do
    it "creates a deck of 52 cards" do
      deck = Deck.new
      expect(deck.cards.size).to eq(52)
    end
  end

  describe "#deal" do
    it "deals the specified number of cards from the deck" do
      deck = Deck.new
      cards = deck.deal(5)
      expect(cards.size).to eq(5)
      expect(deck.cards.size).to eq(47)
    end
  end
end
