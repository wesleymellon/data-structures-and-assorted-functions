require_relative "board"

# class Game
#   def parents_say_hi
#     piece = KnightPiece.new
#     piece.says_hi
#   end
# end

# game1 = Game.new
# game1.parents_say_hi

class Location
  attr_accessor :value, :parent

  def initialize(value, parent)
    @value = value
    @parent = parent
  end

end

class KnightAlpha
  attr_accessor :start_point, :end_point

  def initialize(start_point, end_point)
    @start_point = Location.new(start_point, nil)
    @end_point = Location.new(end_point, nil)
  end

  def validLocation(location)
    return location.value[0] >= 0 && location.value[0] < 8 && location.value[1] >= 0 && location.value[1] < 8
  end

  def foo
    location_queue = [@start_point]

    until location_queue.empty?
      current_location = location_queue.shift
      next unless validLocation(current_location)
      if current_location.value == @end_point.value
        node_counter = 0
        knight_path = []
        correct_path_location = current_location
        until correct_path_location.parent.nil?
          knight_path << correct_path_location
          node_counter += 1
          correct_path_location = correct_path_location.parent
        end
        knight_path << correct_path_location
        knight_path.reverse!

        puts "You made it in #{node_counter} moves! Here's your path:"
        knight_path.each do |e|
          puts "#{e.value}"
        end

        return
      else
        location_queue << Location.new([current_location.value[0] - 1, current_location.value[1] + 2], current_location)
        location_queue << Location.new([current_location.value[0] + 1, current_location.value[1] + 2], current_location)
        location_queue << Location.new([current_location.value[0] + 2, current_location.value[1] + 1], current_location)
        location_queue << Location.new([current_location.value[0] + 2, current_location.value[1] - 1], current_location) 
        location_queue << Location.new([current_location.value[0] + 1, current_location.value[1] - 2], current_location)
        location_queue << Location.new([current_location.value[0] - 1, current_location.value[1] - 2], current_location)
        location_queue << Location.new([current_location.value[0] - 2, current_location.value[1] - 1], current_location)
        location_queue << Location.new([current_location.value[0] - 2, current_location.value[1] + 1], current_location)
      end
    end
  end
end

knight1 = KnightAlpha.new([1,1], [3, 3])

knight1.foo

