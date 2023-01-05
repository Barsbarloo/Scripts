puts "Let's play, Guess the number between 1-10 "
rand_number = (rand * 10).to_i + 1
loop do
  number = gets.to_i
  if number == rand_number
    puts "Excellent"
    break
  elsif number > rand_number
    puts "My number is smaller"
  else
    puts "My number is bigger"
  end
end