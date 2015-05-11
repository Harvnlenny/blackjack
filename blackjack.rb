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
elsif dealer_total == 21
  puts "You lost! Dealer hit Blackjack."
else puts "One of the dealer's card is facedown. The other card is a #{dealer_hand[0]}." 
  puts "Your cards are: "
  puts player_hand 
  puts "Your total sum is #{player_hand.inject(0) { |sum, card| sum += card.value } }."
  puts "Do you want to hit or stay? Please type 'H' for 'Hit' or 'S' for 'Stay'"
  hit_or_stay = gets.chomp

  while hit_or_stay.upcase != "S" do
    if hit_or_stay.upcase == "H"
      player_hand << deck.draw
      if player_total > 21
        puts player_hand, dealer_hand
        puts "You lost."
      end  
    elsif hit_or_stay.upcase != "S"
      puts "Please type 's' or 'h'."
    end  
    puts puts "Your cards are: "
    puts player_hand 
    puts "Your total sum is #{player_hand.inject(0) { |sum, card| sum += card.value } }."
    puts "Please select 'H' or 'S'."
    hit_or_stay = gets.chomp
      if hit_or_stay == "H"
        player_hand << deck.draw
        if player_total > 21
          puts player_hand, dealer_hand
          puts "You lost."
      elsif hit_or_stay == "S"
        end
                    
  end
  
  while dealer_total < 16 do
    dealer_hand << deck.draw
    if dealer_total > 21
      puts player_hand, dealer_hand
      puts "#{name}, you won!"
    end
  end


if player_total > dealer_total
  puts "Your cards were:"
  puts player_hand 
  puts "Dealer's cards were:"
  puts dealer_hand
  puts "You won #{name}."  
elsif dealer_total > player_total
  puts "Your cards were:"
  puts player_hand 
  puts "Dealer's cards were:"
  puts dealer_hand
  puts "You lost #{name}." 
else 
  puts "Your cards were:"
  puts player_hand 
  puts "Dealer's cards were:"
  puts dealer_hand
  puts "Can you believe it #{name}, it's a tie? Sorry, the house wins all ties." 
end
end


end
