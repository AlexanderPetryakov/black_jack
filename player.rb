class Player

  attr_accessor :name
  attr_reader :points

  CARDS = ['A','2','3','4','5','6','7','8','9','10','J','Q','K']
  CARDS_POINTS = {'A': 11,'2': 2,'3': 3,'4': 4,'5': 5,'6': 6,'7': 7,'8': 8,'9': 9,'10': 10,'J': 10,'Q': 10,'K': 10}
  SUITS = ["\u2660","\u2663","\u2666","\u2665"]
  MAX = 21
  @@deck_of_cards = []
  @@ins = []
  @@bank = 0

  def self.new_game
    SUITS.each do |suit|
      CARDS.each do |card|
        @@deck_of_cards << suit + " " + card
      end
    end
    @@bank = 0
  end

  def self.get(number)
    @@ins[number]
  end

  def self.show_bank
    @@bank.to_s + "$"
  end

  def initialize(name = "Player")
    @name = name
    @bank_account = 100
    @hand = []
    @points = 0
    @@ins << self
  end

  def deal
    @hand << @@deck_of_cards.delete_at(Random.rand(@@deck_of_cards.length))
    @hand << @@deck_of_cards.delete_at(Random.rand(@@deck_of_cards.length))
  end

  def deal_one
    @hand << @@deck_of_cards.delete_at(Random.rand(@@deck_of_cards.length))
  end

  def show_hand
    @hand.each {|card| print card + " "}
  end

  def count
    points = []
    sum = 0
    @hand.each do |card|
      key = card[/[A-Z0-9]{1,2}/].to_sym
      points << CARDS_POINTS[key]
    end
    points.each {|num| sum += num}
    points.sort!
    points[-1] = 1 if sum > MAX && points.include?(11)
    sum = 0   
    points.each {|num| sum += num}
    @points = sum
  end

  def wager
    @bank_account -= 10
    @@bank += 10
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

  def bank_account
    @bank_account.to_s + "$"
  end

end
