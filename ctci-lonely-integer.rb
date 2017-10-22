# https://www.hackerrank.com/challenges/ctci-lonely-integer

gets # Don't need n
array = gets.strip.split(" ").map(&:to_i)
puts array.group_by { |x| x }.find { |_, v| v.length == 1 }.first
