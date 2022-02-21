class Array
  def to_histogram
    each_with_object({}) do |fruit, result|
      result[fruit] ||= 0
      result[fruit] += 1
    end
  end
end

fruit = ['orange', 'banana', 'banana', 'banana', 'lemon', 'lemon', 'berry']

puts fruit.to_histogram
# puts fruit.tally # solution with ruby method