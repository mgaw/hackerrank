# https://www.hackerrank.com/challenges/ctci-balanced-brackets

def match?(x, y)
  (x == "(" && y == ")") || (x == "[" && y == "]") || (x == "{" && y == "}")
end

gets.strip.to_i.times do
  expression = gets.strip
  stack = []
  answer = "YES"
  expression.split("").each do |char|
    if char == "(" || char == "[" || char == "{"
      stack << char
    else
      opening = stack.pop
      unless match?(opening, char)
        answer = "NO"
      end
    end
  end
  answer = "NO" unless stack.empty?
  puts answer
end
