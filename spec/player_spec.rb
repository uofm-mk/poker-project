
require_relative '../lib/player'

RSpec.describe Player do
  let(:hand) { double("Hand") }
  let(:player) { Player.new(hand) }

  describe "#initialize" do
    it "creates a player with the given hand" do
      expect(player.hand).to eq(hand)
    end

    it "initializes player's pot with default value" do
      expect(player.pot).to eq(100)
    end
  end

  describe "#discard_cards" do
    it "calls discard method on player's hand" do
      indices = [0, 2, 4]
      expect(hand).to receive(:discard).with(indices)
      player.discard_cards(indices)
    end
  end

  describe "#fold" do
    it "sets player's hand to nil" do
      player.fold
      expect(player.hand).to be_nil
    end
  end

  describe "#see" do
    it "reduces player's pot by the current bet amount" do
      current_bet = 20
      player.see(current_bet)
      expect(player.pot).to eq(80)
    end
  end

  describe "#raise_bet" do
    it "reduces player's pot by the specified amount" do
      amount = 30
      player.raise_bet(amount)
      expect(player.pot).to eq(70)
    end
  end
end
