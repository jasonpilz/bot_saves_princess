def display_path_to_princess(n, grid)
  moves         = []
  peach_xy      = []
  mariobot_xy   = []

  grid.each_with_index do |line, index|
    if line.include?("p")
      peach_xy.push(line.chars.index("p"))
      peach_xy.push(index)
    end
  end

  2.times { mariobot_xy.push((n - 1) / 2) }

  cols = peach_xy[0] - mariobot_xy[0]
  rows = peach_xy[1] - mariobot_xy[1]

  rows < 0 ? moves.push("UP\n" * rows.abs) : moves.push("DOWN\n" * rows)
  cols < 0 ? moves.push("LEFT\n" * cols.abs) : moves.push("RIGHT\n" * cols)

  moves.each {|move| puts move}
end

n = gets.to_i
grid = Array.new(n)
(0...n).each {|i| grid[i] = gets.strip}

display_path_to_princess(n, grid)
