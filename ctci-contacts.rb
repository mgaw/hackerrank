# https://www.hackerrank.com/challenges/ctci-contacts

counts = Hash.new(0)
gets.strip.to_i.times do
    op, contact = gets.strip.split(" ")
    if op == "find"
        puts counts[contact]
    else
        (0...contact.length).each do |i|
            counts[contact[0..i]] += 1
        end
    end
end
