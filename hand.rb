class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def score
    ranks = get_ranks(self).sort
    num_ranks = get_score(ranks)
  end

  def get_ranks(hand)
    @cards.map{ |card| card.rank }
  end

  def get_score(ranks)
    ranks.inject(0) do |sum, rank|
      case true
      when rank == "J" || rank == "Q" || rank == "K"
        sum + 10
      when rank == "A"
        if sum + 11 <= 21
          sum + 11
        else
          sum + 1
        end
      else sum + rank.to_i
      end
    end
  end

  def show_hand
    @cards.map{ |card| card.show_card }.join(" ")
  end

  def add(card)
    @cards << card
  end
end
