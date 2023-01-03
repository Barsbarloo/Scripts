puts "Enter number from 1 to 10"
my_number = gets.to_i
comp_number = (rand *10).to_i + 1
if my_number == comp_number
  puts "Excellent"
elsif my_number > comp_number
  puts "My number is smaller"
else
  puts "My number is bigger"
end
puts comp_number