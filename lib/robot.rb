require 'board'

class Robot
  FACING = ['NORTH', 'EAST', 'SOUTH', 'WEST']
  attr_accessor :x, :y, :face

  def initialize
    self.x = nil
    self.y = nil
    self.face = nil
  end

  def set_coordinates coordinates
    return false unless Board.valid_coordinates? coordinates

    self.x, self.y  = [ Integer(coordinates[0]), Integer(coordinates[1]) ]
    return true
  end

  def set_facing facing
    if valid_facing? facing
      self.face = facing
      return true
    else
      puts "Facing has not found among permitted attributes. Please enter valid command."
      return false
    end
  end

  def on_board?
    return false unless self.x or self.y or self.face
    true
  end

  def turn_left
    self.face = FACING[ find_index - 1 ]
  end

  def turn_right
    index = find_index
    index = (index == (FACING.size - 1)) ? 0 : index + 1
    self.face = FACING[ index ]
  end

  private
  def valid_facing? face
    FACING.include?(face)
  end

  def find_index
    index = FACING.index{ |e| e == self.face}
  end
end
