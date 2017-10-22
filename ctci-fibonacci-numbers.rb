# https://www.hackerrank.com/challenges/ctci-fibonacci-numbers

def fibonacci(n)
  return n if n <= 1
  fibonacci(n - 1) + fibonacci(n - 2)
end

puts fibonacci(gets.strip.to_i)
