# require_relative 'flyer'
#
# flyers = []
#
# 1.step(10, 2) do |number|
#   flyers << Flyer.new("Flyer #{number}", "flyer#{number}@example.com", number * 1000)
# end
#
# puts flyers

# def progress(&block)
#   # 0.step(100, 10) do |number|
#   #   yield(number)
#   # end
#   0.step(100, 10, &block)
# end
#
# progress { |percent| puts percent }


def greet
  yield
end

greet { |name, age| puts "Hello, #{name}. You don't look #{age}!"}
