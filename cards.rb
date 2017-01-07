class Cards

  attr_reader :face
  attr_reader :back
  attr_reader :points
  
  CARDS = ['A','2','3','4','5','6','7','8','9','10','J','Q','K']
  SUITS = ["\u2660","\u2663","\u2666","\u2665"]
  CARDS_POINTS = {'A': 11,'2': 2,'3': 3,'4': 4,'5': 5,'6': 6,'7': 7,'8': 8,'9': 9,'10': 10,'J': 10,'Q': 10,'K': 10}
  
  def self.deck_of_cards
    deck_of_cards = []
    SUITS.each do |suit|
      CARDS.each do |card|
        deck_of_cards << Cards.new(suit, card)
      end
    end
    deck_of_cards
  end

  def initialize(suit, card)
    @face = suit + " " + card
    @back = ' * '
    @points = CARDS_POINTS[card.to_sym]
  end

end