class ArrayUtils
  def self.flatten(input)
    return input unless input.is_a? Array
    result_array = []

    input.each do |item|
      if item.is_a? Array
        result_array += self.flatten(item)
      else
        result_array << item
      end
    end
    result_array
  end
end
