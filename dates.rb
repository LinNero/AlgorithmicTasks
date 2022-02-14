require "active_support/time"

puts "Enter date (format: 'month/day/year', '09/18/2020')"
date_str = gets.chomp
date = Date.strptime(date_str, '%m/%d/%Y')
puts "Enter type (days, weeks, months, years)"
type = gets.chomp
puts "Enter length (integer)"
length = gets.to_i
puts "Enter count (integer)"
count = gets.to_i

h = {}
h[type.to_sym] = length
puts h

count.times do |c|
  date = date.to_datetime.advance(h).to_date
  puts date
end