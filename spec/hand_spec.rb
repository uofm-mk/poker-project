
require_relative '../classes/hand'

RSpec.describe Hand do
  let(:cards) { [Card.new('Hearts', '2'), Card.new('Diamonds', '4'), Card.new('Clubs', '6'), Card.new('Spades', '8'), Card.new('Hearts', '10')] }
  let(:hand) { Hand.new(cards) }

  describe "#initialize" do
    it "creates a hand with the given cards" do
      expect(hand.cards).to eq(cards)
    end
  end

  describe "#discard" do
    it "removes the specified cards from the hand" do
      hand.discard([0, 2, 4])
      expect(hand.cards).to eq([cards[1], cards[3]])
    end
  end
end
