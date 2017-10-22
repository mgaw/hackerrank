# https://www.hackerrank.com/challenges/ctci-queue-using-two-stacks

queue = []
gets.strip.to_i.times do
  type, value = gets.strip.split(" ")
  case type
  when "1"
    queue << value
  when "2"
    queue.shift
  when "3"
    puts queue.first
  end
end
