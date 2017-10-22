# https://www.hackerrank.com/challenges/ctci-array-left-rotation

_, k = gets.strip.split(" ").map(&:to_i)
array = gets.strip.split(" ").map(&:to_i)
k.times do
  array << array.shift
end
puts array.join(" ")
