puts "Enter your age"
age = gets.to_i
puts "Enter your country"
country = gets.strip.upcase
if (country == "USA" || country == "Japan") && age >= 21
  puts "Access granted for USA and Japan"
  elsif age >= 18
    puts "Access granted besides USA and Japan"
  else
    puts "Access Denied"
end