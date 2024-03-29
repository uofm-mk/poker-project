

class Player
  attr_accessor  :hand, :pot, :chips

  def initialize(hand = nil, pot = 100, chips = 100)
    @hand = hand
    @pot = pot
    @chips = chips
  end


  def discard_cards(indices)
    @hand.discard(indices) if @hand
  end

  def fold
    # Player decides to fold, removing them from the game
    @hand = nil
  end

  def see(current_bet)
    # Player chooses to match the current bet
    @chips -= current_bet
    @pot += current_bet
  end

  def raise_bet(amount)
    # Player raises the current bet by the specified amount
    @chips -= amount
    @pot += amount
  end
end
