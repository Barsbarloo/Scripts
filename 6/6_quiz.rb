require 'yaml'
all_questions = YAML.safe_load_file('questions.yml', symbolize_names: true)
a_code = 'A'.ord
correct_answer = 0
incorrect_answers = 0
user_answer_char = nil

puts "Enter your name"
name = gets.strip



all_questions.shuffle.each do |question_data|
  puts "\n\n== #{question_data[:question]} ==\n\n"

  correct_answer = question_data[:answers].first

  answers = question_data[:answers].shuffle.each_with_index.inject({}) do |result, (answer, i)|
    answer_char = (a_code + i).chr
    result[answer_char] = answer

    puts "#{answer_char}. #{answer}"
    result
  end


loop do
  puts 'Your answer'
  user_answer_char = gets.strip[0]
  if user_answer_char.between?('A', 'D')
    break
  else
    puts "Answer is must to be between A-D"
  end
end

  if answers[user_answer_char] == correct_answer
    'Excellent'
    correct_answer = correct_answer + 1
  else
    puts " You are wrong"
    puts "Correct answer #{correct_answer}"
    incorrect_answers = incorrect_answers + 1
  end
end