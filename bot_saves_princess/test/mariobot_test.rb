require_relative '../lib/mariobot.rb'
require 'minitest/autorun'
require 'stringio'

module Kernel
  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    return out
  ensure
    $stdout = STDOUT
  end
end

class BotSavesPrincessTest < Minitest::Test
  def test_display_path_to_princess_can_output_path_for_3_x_3_grid
    out = capture_stdout do
      mariobot = Mariobot.new(3, ["---",
                                  "-m-",
                                  "--p"])
      mariobot.display_path_to_princess
    end

    assert_equal "DOWN\nRIGHT\n", out.string
  end

  def test_display_path_to_princess_can_output_path_for_5_x_5_grid
    out = capture_stdout do
      mariobot = Mariobot.new(5, ["-----",
                                  "-----",
                                  "--m--",
                                  "-----",
                                  "p----"])
      mariobot.display_path_to_princess
    end

    assert_equal "DOWN\nDOWN\nLEFT\nLEFT\n", out.string
  end

  def test_display_path_to_princess_can_output_path_for_7_x_7_grid
    out = capture_stdout do
      mariobot = Mariobot.new(7, ["------p",
                                  "-------",
                                  "-------",
                                  "---m---",
                                  "-------",
                                  "-------",
                                  "-------"])
      mariobot.display_path_to_princess
    end

    assert_equal "UP\nUP\nUP\nRIGHT\nRIGHT\nRIGHT\n", out.string
  end
end
