class Game

  require_relative 'cards'
  require_relative 'player'
  require_relative 'dealer'

  MAX = 21

  @@ins

  def self.get
    @@ins
  end

  def initialize(name = "Player")
    @dealer = Dealer.new
    @player = Player.new(name)
    @deck_of_cards = Cards.deck_of_cards
    @bank = 0
    @@ins = self
  end

  def turn1
    puts ''
    puts 'Начнем этот раунд!'
    stats
    dealer.take_card(card, card)
    player.take_card(card, card)
    wager(dealer)
    wager(player)
    count(dealer)
    count(player)
    show1
    if evaluate1 == true
      stats
      true
    else
      false
    end
  end 

  def turn2(bool)
    if bool == true
      player.take_card(card)
      puts "#{player.name} взял карту."
      count(player)
    else
      puts "#{player.name} остался при своих."
    end
    
    bool2 = dealer.think
    if bool2 == true
      dealer.take_card(card)
      puts "#{dealer.name} взял карту."
      count(dealer)
    else
      puts "#{dealer.name} остался при своих."
    end
    show2
    evaluate2
    stats
  end 

  def reset
    @bank = 0
    @deck_of_cards = Cards.deck_of_cards
    if dealer.bank_account == 0
      puts "#{dealer.name} проиграл все деньги."
      false
    elsif player.bank_account == 0
      puts "#{player.name} проиграл все деньги."
      false
    else
      true
    end
  end

  private

  attr_accessor :bank
  attr_accessor :dealer
  attr_accessor :player

  def show1
    puts "В банке: #{bank}$."
    puts "#{dealer.name}: #{dealer.hand_show_backs}."
    puts "#{player.name}: #{player.hand_show}, #{player.points} очков."
  end

  def evaluate1
    if @dealer.points == MAX && @player.points != MAX
      show2
      puts "У #{dealer.name} 21 очко!!!"
      winner(@dealer)
      loser(@player)
      true
    elsif @player.points == MAX && @dealer.points != MAX
      show2
      puts "У #{player.name} 21 очко!!!"
      winner(@player)
      loser(@dealer)
      true
    elsif @dealer.points == MAX && @player.points == MAX
      show2
      puts "У #{player.name} и #{dealer.name} обоих - 21 очко!!!"
      tie
      true
    else
      false
    end
  end 

  def show2
    puts ""
    puts "#{dealer.name}: #{dealer.hand_show}, #{dealer.points} очков."
    puts "#{player.name}: #{player.hand_show}, #{player.points} очков."
  end

  def evaluate2
    if @dealer.points > MAX && @player.points <= MAX
      puts "#{dealer.name} перебор!"
      winner(@player)
      loser(@dealer)
    elsif @dealer.points <= MAX && @player.points > MAX
      puts "#{player.name} перебор!"
      winner(@dealer)
      loser(@player)
    elsif @dealer.points > MAX && @player.points > MAX
      tie_lost
    elsif @dealer.points == @player.points
      tie 
    elsif @dealer.points > @player.points
      winner(@dealer)
      loser(@player)
    else
      winner(@player)
      loser(@dealer)
    end
  end 

  def stats
    puts ""
    puts "#{dealer.name} счет в банке: #{dealer.bank_account}$."
    puts "#{player.name} счет в банке: #{player.bank_account}$."
  end

  def tie
    puts "Ничья!"
    @dealer.won(bank / 2)
    @player.won(bank / 2)
  end

  def tie_lost
    puts "Перебор у обоих игроков!"
    @dealer.won(bank / 2)
    @player.won(bank / 2)
  end

  def winner(player)
    puts "#{player.name} выиграл!!!"
    player.won(bank)
  end

  def loser(player)
    puts "#{player.name} проиграл."
    player.lost
  end

  def card
    @deck_of_cards.delete_at(Random.rand(@deck_of_cards.length))
  end

  def count(player)
    points = []
    sum = 0
    player.hand.each {|card| points << card.points}
    points.each {|num| sum += num}
    points.sort!
    points[-1] = 1 if sum > MAX && points.include?(11)
    sum = 0   
    points.each {|num| sum += num}
    player.points = sum
  end

  def wager(player)
    puts "#{player.name} сделал ставку."
    @bank += player.wager
  end
  
end
