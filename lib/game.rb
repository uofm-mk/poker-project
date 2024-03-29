
require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require_relative 'player'


class Game
  attr_reader :deck, :players, :pot

  def initialize(num_players) #initialize gameplay deal cards and chips
    @deck = Deck.new
    @players = Array.new(num_players) { Player.new }
    @pot = 100
  end

  def deal_cards #deal each player 5 cards
    5.times { @players.each { |player| player.hand = Hand.new(@deck.deal(5)) } }
  end

  def discard_phase #player discards up to 3 cards
    @players.each do |player|
      puts "Player #{player}'s hand: #{player.hand.cards}"
      print "Enter indices of cards to discard (e.g., 0 2 4): "
      indices = gets.chomp.split.map(&:to_i)
      player.discard_cards(indices)
    end
  end

  def betting_round #betting starts at 0 each round
    current_bet = 0
    @players.each do |player|
      puts "Current pot: #{@pot}"
      puts "Player #{player} has #{@pot - current_bet} chips left"
      puts "Enter your action (fold, see, raise): "
      action = gets.chomp.downcase
      case action
      when 'fold'
        player.fold
      when 'see'
        player.see(current_bet)
      when 'raise'
        print "Enter amount to raise: "
        amount = gets.chomp.to_i
        player.raise_bet(amount)
        current_bet += amount
      else
        puts "Invalid action. Please try again."
        redo
      end
    end
  end

  def showdown
    winner = @players.max_by { |player| player.hand.evaluate }
    winner.pot += @pot
    @pot = 0
    puts "Player #{winner} wins the pot!"
  end

  def start
    loop do
      deal_cards
      discard_phase
      betting_round
      showdown

      puts "Do you want to play another round? (yes/no)"
      answer = gets.chomp.downcase
      break if answer == 'no'
    end
  end

  # Get the number of players from user input
    print "Enter the number of players: "
num_players = gets.chomp.to_i

  # Validate input
  if num_players < 2 || num_players > 4
    puts "Invalid number of players. Please enter a number between 2 and 10."
    exit
  end

  # Initialize and start the game
  game = Game.new(num_players)
  game.start
end
