require_relative 'controller'
class View
  def initialize(file)
    @file = file
  end

  def run
    @control = Controller.New(@file)
    # correct_answer = 0
    @control.deck.each do |question|
      puts @control.ask_question
      if control.check_answer(answer = gets.chomp)
        # correct_answer += 1
        puts "Correct!"
      else
        puts "Incorrect!"
      end
    end
    puts "You solved, #{controller.correct_answer_counter} many questions correctly"
  end
end


