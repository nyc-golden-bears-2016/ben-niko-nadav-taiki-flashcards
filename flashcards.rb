class FlashCard
  attr_reader :question, :answer
  def initialize(args = {})
    @question = args[:question]
    @answer = args[:answer]
  end

  def check_answer(user_input)
    if user_input.downcase
    end
  end
end





