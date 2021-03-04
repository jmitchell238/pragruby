
# def with_debugging
#   puts "Got here!"
#   result = yield
#   puts "result was #{result}"
# end

def with_expectation(expected_value)
  puts "Running test..."
  result = yield
  if result == expected_value
    puts "Passed"
  else
    puts "Failed!"
    end
  puts "#{expected_value} was expected, received #{result}"
end

with_expectation(4) {2 + 2}

# with_debugging do
#   magic_number = (23 - Time.now.hour) * Math::PI
# end

