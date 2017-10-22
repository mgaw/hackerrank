# https://www.hackerrank.com/challenges/ctci-big-o

gets.strip.to_i.times do
  n = gets.strip.to_i
  prime = true
  (2..Math.sqrt(n).floor).each do |x|
    if n % x == 0
      prime = false
      break
    end
  end
  if prime && n > 1
    puts "Prime"
  else
    puts "Not prime"
  end
end
