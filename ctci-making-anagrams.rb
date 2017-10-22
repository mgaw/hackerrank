# https://www.hackerrank.com/challenges/ctci-making-anagrams

a = gets.strip.split("")
b = gets.strip.split("")

counts = Hash.new(0)

a.each do |letter|
  counts[letter] += 1
end

b.each do |letter|
  counts[letter] -= 1
end

puts counts.values.map(&:abs).sum
