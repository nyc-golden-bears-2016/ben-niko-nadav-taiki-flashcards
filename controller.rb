require_relative 'deck'
require_relative 'flashcards'
require_relative 'view'


class Controller

  attr_reader :deck, :number_of_corrects

  def initialize
    @number_of_corrects = 0
    @card = nil
    @card_length = 0
    @view = View.new
    choices
  end

  def run(text_file)
    #get from model the data that is needed
    @deck = Deck.new(text_file)
    @deck.build_deck
    @card_length = @deck.flashcards.length
    #pass data to view for view to display to console
    @deck.shuffle
    @deck.flashcards.each_with_index do |question, i|
      @card = @deck.flashcards[i]
      if @view.display_question(@card.question).downcase == @card.answer
        @number_of_corrects += 1
        @view.clearscreen
        @view.display_correct
      else
        @view.clearscreen
        @view.display_incorrect
      end
    end
  end

  def choices
  user_choice = ""
  while user_choice != "exit"
    @view.display_menu
    user_choice = gets.chomp
    case user_choice
      when "1"
        @view.clearscreen
        @view.display_choice("Nighthawks")
        run("nighthawk_flashcard_data.txt")
        @view.clearscreen
        @view.display_number_of_correct(@number_of_corrects, @card_length)
        gets.chomp
      when "2"
        @vew.clearscreen
        @view.display_choice("Otter")
        run("otter_flashcard_data.txt")
        @view.clearscreen
        @view.display_number_of_correct(@number_of_corrects, @card_length)
        gets.chomp
      when "3"
        @view.clearscreen
        @view.display_choice("Raccon")
        run("raccoon_flashcard_data.txt")
        @view.clearscreen
        @view.display_number_of_correct(@number_of_corrects, @card_length)
        gets.chomp
      end
    end
  end
end


