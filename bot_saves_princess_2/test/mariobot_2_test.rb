require_relative '../lib/mariobot_2.rb'
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

class Mariobot2Test < Minitest::Test
  def test_can_output_next_move_for_peach_above_mario
    skip
    out = capture_stdout do
      mariobot = Mariobot2.new('3',
                               '1 1',
                               ["-p-",
                                "-m-",
                                "---"])
      mariobot.next_move
    end

    assert_equal "UP", out.string
  end

  def test_can_output_next_move_for_peach_below_mario
    out = capture_stdout do
      mariobot = Mariobot2.new('5',
                               '2 1',
                               ["-----",
                                "-----",
                                "-m---",
                                "-----",
                                "p----"])
      mariobot.next_move
    end

    assert_equal "DOWN", out.string
  end

  def test_can_output_next_move_for_peach_left_of_mario
    skip
    out = capture_stdout do
      mariobot = Mariobot2.new('5',
                               '2 3',
                               ["-----",
                                "-----",
                                "p--m-",
                                "-----",
                                "-----"])
      mariobot.next_move
    end

    assert_equal "LEFT", out.string
  end

  def test_can_output_next_move_for_peach_right_of_mario
    skip
    out = capture_stdout do
      mariobot = Mariobot2.new('5',
                               '2 1',
                               ["-----",
                                "-----",
                                "-m--p",
                                "-----",
                                "-----"])
      mariobot.next_move
    end

    assert_equal "RIGHT", out.string
  end
end
