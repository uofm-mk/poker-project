
require_relative '../lib/hand'

RSpec.describe Hand do
  let(:cards) { [Card.new('Hearts', '2'), Card.new('Diamonds', '4'), Card.new('Clubs', '6'), Card.new('Spades', '8'), Card.new('Hearts', '10')] }
  let(:hand) { Hand.new(cards) }

  describe "#initialize" do
    it "creates a hand with the given cards" do
      expect(hand.cards).to eq(cards)
    end
  end

  describe "#evaluate" do
    context "when the hand is a four of a kind" do
      it "returns :four_of_a_kind" do
        hand = Hand.new([
          Card.new('Hearts', '10'),
          Card.new('Diamonds', '10'),
          Card.new('Clubs', '10'),
          Card.new('Spades', '10'),
          Card.new('Hearts', 'A')
        ])
        expect(hand.evaluate).to eq(:four_of_a_kind)
      end
    end

    context "when the hand is a full house" do
      it "returns :full_house" do
        hand = Hand.new([
          Card.new('Hearts', '10'),
          Card.new('Diamonds', '10'),
          Card.new('Clubs', '10'),
          Card.new('Spades', 'A'),
          Card.new('Hearts', 'A')
        ])
        expect(hand.evaluate).to eq(:full_house)
      end
    end


  end


end
