require_relative "knight_piece"

class Board
  attr_accessor :left_border, :right_border, :top_border, :bottom_border

  def initialize(left_border, right_border, top_border, bottom_border)
    @left_border = left_border
    @right_border = right_border
    @top_border = top_border
    @bottom_border = bottom_border
  end

  def validLocation(location)
    return location.value[0] >= @left_border && location.value[0] < @right_border && location.value[1] >= @bottom_border && location.value[1] < @top_border
  end
end