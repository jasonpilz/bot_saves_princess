def next_move(n, r, c, grid)
  puts "0 0"
end

n    = gets.to_i
r, c = gets.strip.split.map {|num| num.to_i}
grid = Array.new(n)

(0...n).each {|i| grid[i] = gets}

next_move(n, r, c, grid)
