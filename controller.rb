require_relative 'deck'
require_relative 'flashcards'
require_relative 'view'

require 'pry'

class Controller

  attr_reader :deck, :number_of_corrects

  def initialize
    @card = nil
    @card_length = 0
    @view = View.new
    choices
  end

  def run(text_file)
    #get from model the data that is needed
    @number_of_corrects = 0
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
    choosen_quiz = ["Nighthwak", "Otter", "Raccoon"]
    choosen_quiz_file_name = ["nighthawk_flashcard_data.txt", "otter_flashcard_data.txt", "raccoon_flashcard_data.txt"]
   
      while user_choice != "exit"
        @view.display_menu
        user_choice = gets.chomp
        if user_choice.to_i.between?(1, 3)
          @view.clearscreen
          @view.display_choice(choosen_quiz[user_choice.to_i-1])
          run(choosen_quiz_file_name[user_choice.to_i-1])
          @view.clearscreen
          @view.display_number_of_correct(@number_of_corrects, @card_length)
          gets.chomp
        end
      end
  end
end


