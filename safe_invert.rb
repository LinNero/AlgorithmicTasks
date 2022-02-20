class Hash
  def safe_invert
    result = {}
    each do |fruit, country|
      result[country] ||= []
      result[country] << fruit
    end
    result
  end
end

fruits_country = {
  'orange' => 'Marocco',
  'banana' => 'Ecuador',
  'lemon' => 'Marocco'
}

puts fruits_country.safe_invert