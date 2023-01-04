puts "Enter your age"
age = gets.to_i
puts "Enter 1 if you are from USA or Japan, 2 if you are from EU and other countries"
country = gets.to_i
if age >= 21 || (age >=18 && country == 2)
  puts "Access granted"
else
  puts "Access Denied"
end