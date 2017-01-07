class Dealer < Player
  require_relative 'player'

  def initialize
    super("Dealer")
  end

  def hand_show_backs
    str = ""
    @hand.each {|card| str += card.back}
    str
  end

  def think
    bool = false
    self.hand.each do |card|
      bool = true if card.points == 11 && self.points < 18
    end

    if bool == true
      true
    elsif self.points < 15
      true
    else
      false
    end        
  end

end
