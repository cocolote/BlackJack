class Card
  attr_reader :rank

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def show_card
    "#{@rank}#{@suit}"
  end
end
