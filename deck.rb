$LOAD_PATH.unshift File.dirname(__FILE__)
require 'card'

class Deck < Card

  def initialize
    @cards = []
    suits = [:hearts, :diamonds, :spades, :clubs]
    suits.each do |suit|
      (2..10).each do |value|
        @cards << Card.new(suit, value)
      end
      @cards << Card.new(suit, "J")
      @cards << Card.new(suit, "Q")
      @cards << Card.new(suit, "K")
      @cards << Card.new(suit, "A")
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def draw
    @cards.shift
  end

end

deck = Deck.new