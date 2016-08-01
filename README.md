# Toy Robot Simulator
 It's an example application in ruby for simulate toy robot moving on a square tabletop, of dimensions 5 units x 5 units
### Description:

* The robot is free to roam around the surface of the table, but must be prevented from falling to destruction.
* Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.
* Any move that would cause the robot to fall must be ignored.
* The origin (0,0) can be considered to be the SOUTH WEST most corner
* Input data can be provided with input.txt file or with manual input. 

### Available Commands

#### PLACE X,Y,FACING
puts the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST. It's first valid command to the robot, after that, any sequence of commands may be issued, in any order.

#### MOVE 
moves the toy robot one unit forward in the direction it is currently facing.

**LEFT** and **RIGHT**

rotateS the robot 90 degrees in the specified direction without changing the position of the robot.

#### REPORT 
announceS the X,Y and orientation of the robot.

### Installing

	git clone git@github.com:NadyaShevtsova/toy_robot.git
	cd toy_robot
	gem install bundler
	bundle install
	
### Using
input data manually:

	$ ruby main.rb
	Put robot on the desc:
	PLACE 0,0,NORTH
	MOVE
	REPORT
	Output: 0,1,NORTH
	
input data from file input.txt:

	$ cat input.txt | ruby main.rb 
	Put robot on the desc:
	Output: 0,1,NORTH
	Output: 0,0,WEST
	Output: 3,3,NORTH

### Notes
* empty lines or lines contain only whitespace is ignored
* using multiple valid commands in one line: only first of them will be execute and other will be ignored
* to stop running the application print *exit*
* all commands are case-sensitive (e.g. `PLACE` is valid but `place` isn't)
* arguments of `PLACE` command are separated only by comma (e.g. `0,0,NORTH` are valid but `0, 0, NORTH` aren't)

### Tests
Execute tests with "rspec spec":

	$ rspec spec  
	x or y coordinate is not a number. Please enter valid command.
	..x or y coordinate is not a number. Please enter valid command.
	..x or y coordinate is not a number. Please enter valid command.
	..x or y coordinate is not a number. Please enter valid command.
	..x, y coordinates are not on board. Please enter valid command.
	..x, y coordinates are not on board. Please enter valid command.
	..x, y coordinates are not on board. Please enter valid command.
	...........Command not found. Please enter valid command.
	.Command not found. Please enter valid command.
	.Command not found. Please enter valid command.
	.Command not found. Please enter valid command.
	.Command not found. Please enter valid command.
	.Command not found. Please enter valid command.
	.Command not found. Please enter valid command.
	.First command should be PLACE. Please enter valid command.
	.First command should be PLACE. Please enter valid command.
	.First command should be PLACE. Please enter valid command.
	.First command should be PLACE. Please enter valid command.
	......First command should be PLACE. Please enter valid command.
	.......Facing has not found among permitted attributes. Please enter valid command.
	.........x, y coordinates are not on board. Please enter valid command.
	..............Facing has not found among permitted attributes. Please enter valid command.
	.Facing has not found among permitted attributes. Please enter valid command.
	...............
	Finished in 0.03838 seconds (files took 0.25075 seconds to load)
	85 examples, 0 failures


