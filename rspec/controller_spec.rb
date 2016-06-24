require_relative '../controller.rb'
#require_relative '../nighthawk_flashcard_data.txt'


describe Controller do
	let (:controller) {Controller.new}
	test_file = 'nighthawk_flashcard_data.txt'
	it 'is run with #{test_file}' do
		controller.run(test_file)
		expect(@view.display_choice(choosen_quiz[user_choice.to_i-1])).to eq ()

	end
end