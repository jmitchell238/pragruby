numbers = (1..10).to_a
puts numbers.select { |n| n.even? }\

def my_select(array)
  results = []
  array.each do |element|
    results << element if yield(element)
  end
  results
end

puts my_select(numbers) {|n| n.even?}


def n_times(n)
  1.upto(n) do |count|
    yield count
  end
end

n_times(7) do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end

