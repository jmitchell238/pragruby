def roll
  puts "Starting method..."
  number = rand(1..6)
  result = yield "Larry", number
  yield "Moe" , result
  puts "Back in method."
end

roll do |name, number|
  puts "#{name} rolled a #{number}!"
  number * 2
end

# def n_times(number)
#   1.upto(number) do |count|
#     yield(count)
#   end
# end
#
# n_times(5) do |n|
#   puts "#{n} situps"
#   puts "#{n} pushups"
#   puts "#{n} chinups"
# end
