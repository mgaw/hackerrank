# https://www.hackerrank.com/challenges/ctci-ransom-note

gets # Don't need the counts
magazine = gets.strip.split(" ")
ransom = gets.strip.split(" ")

words = Hash.new(0)
magazine.each { |word| words[word] += 1 }
ransom.each { |word| words[word] -= 1 }
if words.values.any? { |x| x < 0 }
  puts "No"
else
  puts "Yes"
end
