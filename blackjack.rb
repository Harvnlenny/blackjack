puts "***********************************"
puts "Welcome to The Iron Yard Blackjack!"
puts "***********************************"
puts ""

$LOAD_PATH.unshift File.dirname(__FILE__)
require 'deck'

puts "I'm going to be the dealer, and my name is Aaron."
puts "What's your name?"
name = gets.chomp
puts "Nice to meet you, #{name}! Good luck, you are going to need it."
puts

deck = Deck.new
deck.shuffle

dealer_hand = []
player_hand = []
2.times do 
  dealer_hand << deck.draw
  player_hand << deck.draw
end

dealer_total = dealer_hand.inject(0) { |sum, card| sum += card.value}
player_total = player_hand.inject(0) { |sum, card| sum += card.value}

if player_total == 21
  puts player_hand, dealer_hand
  puts "Congratualations, #{name}! You just hit Blackjack."
  exit
elsif dealer_total == 21
  puts "You lost! Dealer hit Blackjack."
  exit
else 
  puts "One of the dealer's card is facedown. The other card is a #{dealer_hand[0]}." 
  puts "Your cards are: "
  puts player_hand 
  puts "Your total sum is #{player_hand.inject(0) { |sum, card| sum += card.value } }."
  puts "Do you want to hit or stay? Please type 'H' for 'Hit' or any other key for stay."
  hit_or_stay = gets.chomp

    if hit_or_stay.upcase == "H"
      player_hand << deck.draw
      puts player_hand
      player_total = player_hand.inject(0) { |sum, card| sum += card.value}
      puts player_total
      if player_total > 21
        puts
        puts "You lost."
        exit
      else
        puts puts "Do you want to hit or stay?"
        hit_or_stay = gets.chomp
        if hit_or_stay.upcase == "H"
        player_hand << deck.draw
        puts player_hand
        player_total = player_hand.inject(0) { |sum, card| sum += card.value}
        puts player_total
          if player_total > 21
          puts player_hand, dealer_hand
          puts "You went bust so you lost."
          exit
          end  
        else
        end
      end
    else 
      puts dealer_hand   
    end
  
  while dealer_total < 16 do
    dealer_hand << deck.draw
    if dealer_total > 21
      puts player_hand, dealer_hand
      puts "#{name}, you won! Dealer went bust."
    else
      puts
    end    
  end



  if player_total > dealer_total
    puts "Your cards were:"
    puts player_hand 
    puts "Dealer's cardz were:"
    puts dealer_hand
    if player_total < 22
      puts "You won #{name}."
    else 
      puts "You went bust. You lost #{name}."  
    exit
    end  
  elsif dealer_total > player_total
    puts "Your cards were:"
    puts player_hand 
    puts "Dealer's cards were:"
    puts dealer_hand
    puts "You lost #{name}."
    exit 
  else 
    puts "Your cards were:"
    puts player_hand 
    puts "Dealer's cards were:"
    puts dealer_hand
    puts "Can you believe it #{name}, it's a tie? Sorry, the house wins all ties."
    exit 
  end
end

