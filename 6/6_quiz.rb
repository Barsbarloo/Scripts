require 'yaml'
all_questions = YAML.safe_load_file('questions.yml', symbolize_names: true)
a_code = 'A'.ord
correct_answers = 0
incorrect_answers = 0
user_answer_char = nil

puts "Enter your name"
name = gets.strip

current_time = Time.now.strftime('%Y-%m-%d')
filename = "QUIZ_#{name}_#{current_time}.txt"
File.write(filename, "Result for user #{name}\n\n",
  mode: 'a')

all_questions.shuffle.each do |question_data|
  formatted_question = "\n\n== #{question_data[:question]} ==\n\n"
  puts formatted_question

  File.write(filename, formatted_question,
    mode: 'a')

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

File.write(filename, " User answer #{answers[user_answer_char]}\n\n",
  mode: 'a')

  if answers[user_answer_char] == correct_answer
    puts "Excellent"
    correct_answers = correct_answers + 1
    File.write(filename, "Correct", mode: 'a')
  else
    puts " You are wrong"
    puts "Correct answer #{correct_answer}"
    incorrect_answers = incorrect_answers + 1
    File.write(filename, "Incorrect, Correct answer #{correct_answer}", mode: 'a')
  end
end

File.write(filename, " Correct answers #{correct_answers}\n\n", mode: 'a')

File.write(filename, " Incorrect answers #{incorrect_answers}\n\n", mode: 'a')

correct_answer_percentage = (correct_answers / all_questions.length.to_f) * 100

File.write(filename, "Correct answers percentage #{correct_answer_percentage}\n\n", mode: 'a')
