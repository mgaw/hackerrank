# https://www.hackerrank.com/challenges/ctci-recursive-staircase

@p_counts = {}

# Returns the number of possiblities
def p_count(n)
  return 1 if n == 0
  return @p_counts[n] if @p_counts[n]
  after1 = (n > 0 ? p_count(n-1) : 0)
  after2 = (n > 1 ? p_count(n-2) : 0)
  after3 = (n > 2 ? p_count(n-3) : 0)
  #puts "n=#{n} after1=#{after1} after2=#{after2} after3=#{after3}"
  @p_counts[n] = after1 + after2 + after3
end

gets.strip.to_i.times do
  n = gets.strip.to_i
  puts p_count(n)
end
