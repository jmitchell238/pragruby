require 'timeout'

def try_with_timeout(time_out)
  begin
    Timeout.timeout(time_out) do
      yield
    end
  rescue Timeout::Error
    # handle the Timeout Error
    puts "Took too long!"
  end
end



try_with_timeout(2.0) do
  sleep 3.0
  puts "That was refreshing..."
end
