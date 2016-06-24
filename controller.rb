require_relative 'deck'
require_relative 'flashcards'

class Controller

  attr_reader :deck

  def initialize(text_file)
    @file = text_file
    @deck = Deck.new
    @number_of_corrects = 0
    @card = nil
  end

  def build_deck
    if File.exist?(@file)
      if File.readable?(@file)
        File.open(@file, "r") do |file|
          input_hash = {}
          counter = 1
          file.each_line do |line|
            if counter % 3 != 0
              if counter % 3 == 1
                input_hash[:question] = line.chomp
              else
                input_hash[:answer] = line.chomp
                @deck.flashcards << FlashCard.new(input_hash)
                input_hash = {}
              end
            end
            counter += 1
          end
        end
      else
        "file isn't readable"
      end
    else
      "file doesn't exist"
    end
  end

  def ask_question
    @card = @deck.flashcards.shift
    @card.question
  end

  def check_answer(user_answer)
    if user_answer.downcase == @card.answer
      @number_of_corrects += 1
      true
    else
      false
    end
  end

end

