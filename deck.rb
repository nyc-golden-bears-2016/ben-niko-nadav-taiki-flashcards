class Deck
  require 'pry'

  def initialize(text_file)
    @file = text_file
    @flashcards = []
  end

  def read_file
    File.open(@file, "r") do |file|
      input_hash = {}
      counter = 1
      file.each_line do |line|
        if counter % 3 != 0
          if counter % 3 == 1
            input_hash[:question] = line
          else
            input_hash[:answer] = line
             #flashcard = FlashCard.new(input_hash)
            p input_hash
            input_hash = {}
#thing
          end
        end
        counter += 1
      end
    end
  end
end

test = Deck.new("raccoon_flashcard_data.txt")
test.read_file
