def next_move(n, bot_y, bot_x, grid)
  peach_xy = []

  grid.each_with_index do |line, index|
    if line.include?("p")
      peach_xy.push(line.chars.index("p"))
      peach_xy.push(index)
    end
  end

  cols = peach_xy[0] - bot_x
  rows = peach_xy[1] - bot_y

  if rows != 0
    rows < 0 ? move = "UP" : move = "DOWN"
    puts move; return
  elsif cols != 0
    cols < 0 ? move = "LEFT" : move = "RIGHT"
    puts move
  end
end

n    = gets.to_i
r, c = gets.strip.split.map {|num| num.to_i}
grid = Array.new(n)

(0...n).each {|i| grid[i] = gets}

next_move(n, r, c, grid)
