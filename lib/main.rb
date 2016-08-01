require './lib/robot'
require './lib/command'

robot = Robot.new
command = Command.new( robot )

puts "Put robot on the desc: "

str = gets.chomp
while !str.empty? do
  command.parse_command str
  str = gets.chomp
end
