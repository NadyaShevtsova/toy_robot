require './lib/robot'
require './lib/command'

robot = Robot.new
command = Command.new( robot )

puts "Put robot on the desc: "

while str = gets.to_s.chomp do
  break if str == 'exit'
  next if str.empty?
  command.parse_command str
end