class Deck

  attr_reader :flashcards

  def initialize
    @flashcards = []
  end

  def shuffle
    @flashcards.shuffle!
  end
end


