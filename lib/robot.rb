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

    self.x, self.y  = [ Integer(coordinates[0]), Integer(coordinates[0]) ]
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

  private
  def valid_facing? face
    FACING.include?(face)
  end
end
