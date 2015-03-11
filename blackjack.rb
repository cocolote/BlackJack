#!/usr/bin/env ruby
require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require_relative 'game'

puts "Welcome to BlackJack!"

deck = Deck.new(["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"], ["♠", "♡", "♣", "♢"])
deck.shuffle

player_game = Game.new(deck, "Eze")
deck, player_score = player_game.play

unless player_score == 0
  computer_game = Game.new(deck, "Computer", player_score)
  computer_score = computer_game.play[1]

  if computer_score > player_score
    puts "\nComputer won! #{computer_score}"
  elsif computer_score < player_score
    puts "\nplayer won! #{player_score}"
  else
    puts "Nobody won.. Tie game"
  end
end
