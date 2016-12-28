class Player

  attr_accessor :name
  attr_accessor :bank_account
  attr_accessor :points

  CARDS = ['A','2','3','4','5','6','7','8','9','10','J','Q','K']
  CARDS_POINTS = {'A': 11,'2': 2,'3': 3,'4': 4,'5': 5,'6': 6,'7': 7,'8': 8,'9': 9,'10': 10,'J': 10,'Q': 10,'K': 10}
  SUITS = ["\u2660","\u2663","\u2666","\u2665"]
  @@deck_of_cards = {}

  def self.new_deck 
    SUITS.each do |suit|
      @@deck_of_cards[suit] = CARDS
    end
  end

  def initialize(name = "Player")
    @name = name
    @bank_account = 100
    @hand = []
    @points = 0
  end

  def deal
    suit1 = SUITS[Random.rand(SUITS.length)]
    suit2 = SUITS[Random.rand(SUITS.length)]
    @hand << suit1 + " " + @@deck_of_cards[suit1].delete_at(Random.rand(@@cards.length))
    @hand << suit2 + " " + @@deck_of_cards[suit2].delete_at(Random.rand(@@cards.length))
  end

  def deal_one
    suit = SUITS[Random.rand(@@suits.length)]
    @hand << suit + " " + @@deck_of_cards[suit].delete_at(Random.rand(@@cards.length))
  end

  def show_hand
    @hand.each {|card| print card + " "}
    puts ""
  end

  def count
    points = 0
    @hand.each do |card|
      key = card[/[A-Z0-9]{1,2}/].to_sym
      value = CARDS_POINTS[key]
      points += value
    end
    @points = points
  end

  def wager
    @bank_account -= 10
    10
  end

  def won(bank)
    @bank_account += bank
    self.clear
  end

  def lost
    self.clear
  end

  def clear
    @hand = []
    @points = 0
  end

end
