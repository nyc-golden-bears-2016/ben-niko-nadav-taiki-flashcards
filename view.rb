class View

  def display_question(question)
    puts "#{question}"
    gets.chomp
  end

  def display_correct
    puts "Correct!!!"
  end

  def display_incorrect
    puts "Incorrect!!!"
  end

  def display_number_of_correct(correct, total)
    puts "You got #{correct} of #{total} correct!!! "
    puts "Press return to continue"
  end

  def display_menu
    clearscreen
    puts "Welcome to the QUIZ-A-TRON 5000"
    puts "================================"
    puts "Please select a set of questions:"
    puts "--------------------------------"
    puts "1. Nighthawks"
    puts "2. Otter"
    puts "3. Raccoon\n\n"
    puts "To exit, type 'exit'\n\n\n"
  end

  def clearscreen
    puts "\e[H\e[2J"
  end

  def display_choice(quiz)
    "#{quiz} Selected."
  end
end

