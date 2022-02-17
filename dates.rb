require "active_support/time"

input_hash = {}
input_hash[:date] = lambda do
  puts "Enter date (format: 'month/day/year', '09/18/2020')"
  date_str = gets.chomp
  date = Date.strptime(date_str, '%m/%d/%Y')
end

input_hash[:type] = lambda do
  puts "Enter period type (days, weeks, months, years)"
  type = gets.chomp
end

input_hash[:length] = lambda do
  puts "Enter length of the type (integer)"
  length = gets.to_i
end

input_hash[:count] = lambda do
  puts "Enter count of dates (integer)"
  count = gets.to_i
end

date = input_hash[:date].call

h = {}
h[input_hash[:type].call.to_sym] = input_hash[:length].call
puts h


input_hash[:count].call.times do |c|
  date = date.to_datetime.advance(h).to_date
  puts date
end