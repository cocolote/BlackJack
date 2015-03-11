class Game
  def initialize(bjdeck, player = "player", score = 0)
    @bjdeck = bjdeck
    @player = player
    @hand = Hand.new
    @score = score
  end

  def play
    2.times { @hand.add(@bjdeck.draw!) }

    while true
      puts "\n#{@player} hand: #{@hand.show_hand}"
      puts "#{@player} score: #{@hand.score}"
      if @player != "Computer"
        print "\nHit or Stand?(H/S): "; option = gets.chomp.upcase
      else
        @hand.score >= 17 || @hand.score >= @score ? option = "S" : option = "H"
      end

      case option
      when "H"
        @hand.add(@bjdeck.draw!)
        if @hand.score > 21
          puts "Bust! Game over.."
          score = 0
          break
        end
      when "S"
        score = @hand.score
        break
      else puts "Come one bro! Hit or Stand? Ain't nobody got time for that!"
      end
    end
    [@bjdeck, score]
  end
end
