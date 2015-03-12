require 'pry'
class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def score
    num_ranks = get_score(get_ranks(self).sort)
  end

  def show_hand
    @cards.map{ |card| card.show_card }.join(" ")
  end

  def add(card)
    @cards << card
  end

private
  def get_ranks(hand)
    @cards.map{ |card| card.rank }
  end

  def get_score(ranks)
    if ranks.include?("A")
      aces = ranks.grep("A")
      ranks.delete("A")
      (ranks << aces).flatten!
    end
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
end
