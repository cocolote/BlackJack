class Deck
  def initialize(ranks, suits)
    @cards = []
    suits.each do |suit|
      ranks.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def draw!
    @cards.pop
  end
end
