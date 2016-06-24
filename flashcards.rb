class FlashCard
  attr_reader :question, :answer
  def initialize(args = {})
    @question = args[:question]
    @answer = args[:answer]
  end
end





