# spec/card_spec.rb
require_relative '../classes/card'

RSpec.describe Card do
  describe "#initialize" do
    it "creates a card with a suit and value" do
      card = Card.new("Hearts", "A")
      expect(card.suit).to eq("Hearts")
      expect(card.value).to eq("A")
    end
  end
end
