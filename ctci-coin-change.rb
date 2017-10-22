# https://www.hackerrank.com/challenges/ctci-coin-change

# Need "min" parameter to only count ascending sequences to make order insignificant
def count(coins, acc, x, min=1)
  return 1 if x == 0
  return 0 if x < 0
  return acc[[x, min]] if acc[[x, min]]

  acc[[x, min]] = coins
    .find_all { |c| c >= min }
    .map { |c| count(coins, acc, x-c, c) }
    .sum
end

n, _ = gets.strip.split(' ').map(&:to_i)
coins = gets.strip.split(' ').map(&:to_i)

puts count(coins, {}, n)
