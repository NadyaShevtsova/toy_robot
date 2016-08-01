require './lib/robot'

class Command
  COMMANDS = [ 'PLACE', 'MOVE', 'REPORT', 'LEFT', 'RIGHT' ]
  TURN_RULES = Hash[Robot::FACING.zip [[ 0, 1 ], [ 1, 0 ], [ 0, -1], [ -1, 0]]]

  def initialize robot
    @robot = robot
  end

  def parse_command str
    arr_str = str.split(' ')
    command = arr_str[0]

    return false unless valid_command?( command )

    if command == COMMANDS[0]
      send command.downcase, arr_str[1]
    else
      send command.downcase
    end
  end

  def place str
    args = str.to_s.split(',')
    return false unless @robot.set_coordinates( args[0..1] )
    return false unless @robot.set_facing( args[2] )
  end

  def report
    puts "Output: #{@robot.x},#{@robot.y},#{@robot.face}"
  end

  def left
    @robot.turn_left
  end

  def right
    @robot.turn_right
  end

  def move
    x_addition, y_addition = TURN_RULES[@robot.face]
    return false unless @robot.set_coordinates( [ @robot.x + x_addition, @robot.y + y_addition ] )
  end

  private
  def valid_command? command
    if !COMMANDS.include?(command)
      puts "Command not found. Please enter valid command."
      return false
    end

    if !@robot.on_board? && command != COMMANDS[0]
      puts "First command should be PLACE. Please enter valid command."
      return false
    end

    true
  end
end
