data = {'USA' => 'Washington', 'Japan' => 'Tokyo', 'Russia' => 'Moscow', 'Kazakstan' => 'Astana'}
data.each do |country, capital|
  puts "Please write the capital of this country"
  puts country
  user_input = gets.strip.downcase
  if user_input == capital.downcase
    puts "Excellent"
  else
    puts "You ara wrong"
    puts "Right answer is #{capital}"
  end
end