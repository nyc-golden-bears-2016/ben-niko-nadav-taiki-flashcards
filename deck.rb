require_relative 'flashcards'
class Deck

  attr_reader :flashcards

  def initialize(text_file)
    @file = text_file
    @flashcards = []
    read_file
  end

  def read_file
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
                @flashcards << FlashCard.new(input_hash)
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


  def shuffle
    @flashcards.shuffle!
  end
end


