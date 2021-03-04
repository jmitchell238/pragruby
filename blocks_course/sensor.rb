class Sensor

  def temperature
    rand(100..200)
  end

  def level
    rand(1..5)
  end
end

sensor = Sensor.new

def with_checking(description)
  puts "Checking #{description}..."
  result = yield
  if result
    puts "OK"
  else
    puts "FAILED!"
  end
end

with_checking("temperature") { sensor.temperature < 150 }
with_checking("level") { sensor.level < 3 }
with_checking("happiness") { Time.now.wednesday? }
