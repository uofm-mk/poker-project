
require_relative '../lib/game'

RSpec.describe Game do
  let(:game) { Game.new(3) }

  describe "#initialize" do
    it "creates a new game with the specified number of players" do
      expect(game.players.length).to eq(3)
    end

    it "initializes the pot to zero" do
      expect(game.pot).to eq(0)
    end
  end

  describe "#deal_cards" do
    it "deals 5 cards to each player" do
      game.deal_cards
      expect(game.players.all? { |player| player.hand.cards.length == 5 }).to be_truthy
    end
  end


end
