class Player

  attr_reader :name
  attr_accessor :points
  attr_reader :bank_account
  attr_reader :hand

  @@ins = []

  def initialize(name = "Player")
    @name = name
    @hand = []
    @bank_account = 100
    @points = 0
    @@ins << self
  end

  def take_card(*args)
    args.each {|argument| @hand << argument}
  end
  
  def hand_show
    str = ""
    @hand.each {|card| str += card.face}
    str
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
    clear
  end

  protected

  def clear
    @hand = []
    @points = 0
  end

end
