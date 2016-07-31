class Board
  X_SIZE = 5
  Y_SIZE = 5

  def self.valid_coordinates? coordinates
    x_coord = Integer(coordinates[0]) rescue nil
    y_coord = Integer(coordinates[1]) rescue nil

    unless x_coord and y_coord
      puts "x or y coordinate is not a number. Please enter valid command."
      return false
    end
    if (x_coord  >= 0 && x_coord  <= X_SIZE - 1) and (y_coord >= 0 && y_coord <= Y_SIZE - 1)
      return true
    else
      puts "x, y coordinates are not on board. Please enter valid command."
      return false
    end
  end
end
