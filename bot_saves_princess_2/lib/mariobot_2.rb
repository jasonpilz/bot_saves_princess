class Mariobot2
  attr_reader :n, :bot_y, :bot_x, :grid

  def initialize(n, rc, grid)
    @n    = n
    @grid = grid
    @bot_y, @bot_x = extract_bot_coordinates(rc)
  end

  def next_move
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

  private
    def extract_bot_coordinates(rc)
      rc.strip.split.map {|num| num.to_i}
    end
end
