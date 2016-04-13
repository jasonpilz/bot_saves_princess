require 'pry'

def verify_correct_user_input(n, grid)
  # 'n' - must be odd integer
  # 'm' - must be in center
  # 'p' - must be in a corner
  # grid.length == n
  # grid.each{|ary| return false if ary.length != n}
  return true
end

def display_path_to_princess(n, grid)
  raise InvalidInputError unless verify_correct_user_input(n, grid)

  peach_xy      = []
  mariobot_xy   = []
  moves_to_take = []

  grid.each_with_index do |line, index|
    if line.include?("p")
      peach_xy << line.chars.index("p")
      peach_xy << index
    end
  end

  2.times { mariobot_xy.push((n - 1) / 2) }

  until peach_xy[0] == mariobot_xy[0]
    if peach_xy[0] < mariobot_xy[0]
      moves_to_take << 'LEFT'
      mariobot_xy[0] -= 1
    elsif peach_xy[0] > mariobot_xy[0]
      moves_to_take << 'RIGHT'
      mariobot_xy[0] += 1
    end
  end
  until peach_xy[1] == mariobot_xy[1]
    if peach_xy[1] < mariobot_xy[1]
      moves_to_take << 'UP'
      mariobot_xy[1] -= 1
    elsif peach_xy[1] > mariobot_xy[1]
      moves_to_take << 'DOWN'
      mariobot_xy[1] += 1
    end
  end

  moves_to_take.each {|move| puts "#{move}\n"}
end

n = gets.to_i
grid = Array.new(n)
(0...n).each {|i| grid[i] = gets.strip}

display_path_to_princess(n, grid)
