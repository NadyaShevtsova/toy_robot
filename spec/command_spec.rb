require 'command'
require 'byebug'

describe Command do
  let(:robot) { Robot.new }
  let(:command) { Command.new( robot ) }
  let(:robot_on_board) {
    robot.x = 1
    robot.y = 1
    robot.face = 'NORTH'
  }

  context "valid_command?" do

    context "with valid data should return true" do
      context "for all exists commands" do
        before :each do
          robot_on_board
        end

        it { expect( command.send "valid_command?", 'PLACE'  ).to eq( true ) }
        it { expect( command.send "valid_command?", 'MOVE'   ).to eq( true ) }
        it { expect( command.send "valid_command?", 'REPORT' ).to eq( true ) }
        it { expect( command.send "valid_command?", 'LEFT'   ).to eq( true ) }
        it { expect( command.send "valid_command?", 'RIGHT'  ).to eq( true ) }
      end

      context "for first valid command" do
        it { expect( command.send "valid_command?", 'PLACE' ).to eq( true ) }
      end
    end

    context "with invalid data" do
      context "should return false" do

        context "for non existence commands" do
          it { expect( command.send "valid_command?", '' ).to eq( false ) }
          it { expect( command.send "valid_command?", 'place'  ).to eq( false ) }
          it { expect( command.send "valid_command?", 'move'   ).to eq( false ) }
          it { expect( command.send "valid_command?", 'report' ).to eq( false ) }
          it { expect( command.send "valid_command?", 'left'   ).to eq( false ) }
          it { expect( command.send "valid_command?", 'right'  ).to eq( false ) }
          it { expect( command.send "valid_command?", 'some_string'  ).to eq( false ) }
        end

        context "for first invalid command" do
          it { expect( command.send "valid_command?", 'MOVE'   ).to eq( false ) }
          it { expect( command.send "valid_command?", 'REPORT' ).to eq( false ) }
          it { expect( command.send "valid_command?", 'LEFT'   ).to eq( false ) }
          it { expect( command.send "valid_command?", 'RIGHT'  ).to eq( false ) }
        end

      end
      context "should print 'Command not found.' message" do
        it { expect{ command.send "valid_command?", 'some_string' }.to output("Command not found. Please enter valid command.\n").to_stdout }
      end

      context "should print 'First command should be PLACE' message" do
        it { expect{ command.send "valid_command?", 'MOVE'   }.to output("First command should be PLACE. Please enter valid command.\n").to_stdout }
        it { expect{ command.send "valid_command?", 'REPORT' }.to output("First command should be PLACE. Please enter valid command.\n").to_stdout }
        it { expect{ command.send "valid_command?", 'LEFT'   }.to output("First command should be PLACE. Please enter valid command.\n").to_stdout }
        it { expect{ command.send "valid_command?", 'RIGHT'  }.to output("First command should be PLACE. Please enter valid command.\n").to_stdout }
      end
    end
  end

  context "parse_command" do
    context "with valid data" do
      it { expect( command.parse_command 'LEFT'   ).to eq( false ) }
    end
  end

  context "report" do
    it "should return 'Output: 1,1,NORTH' message" do
      robot_on_board
      expect{ command.report }.to output("Output: 1,1,NORTH\n").to_stdout
    end
  end

  context "place" do
    context "with valid data" do
      context "should set coordinates and facing for robot" do
        it { expect{ command.place '0,0,NORTH' }.to change{ robot.face }.from( nil ).to( 'NORTH' ) }
        it { expect{ command.place '0,0,NORTH' }.to change{ robot.x }.from( nil ).to( 0 ) }
        it { expect{ command.place '0,0,NORTH' }.to change{ robot.y }.from( nil ).to( 0 ) }
      end

      context "should return true" do
        it { expect( command.place '0,0,NORTH' ).to eq(true) }
      end
    end

    context "with invalid data" do
      context "should return false" do
        it { expect( command.place '0,0,' ).to eq(false) }
      end

      context "should print 'Facing has not found among permitted attributes' message" do
        it { expect{ command.place '0,0,' }.to output("Facing has not found among permitted attributes. Please enter valid command.\n").to_stdout }
      end

      context "should print 'x or y coordinate is not a number' message" do
        it { expect{ command.place 'a,b,NORTH' }.to output("x or y coordinate is not a number. Please enter valid command.\n").to_stdout }
      end

      context "should print 'x, y coordinates are not on board' message" do
        it { expect{command.place '-1,0,NORTH' }.to output("x, y coordinates are not on board. Please enter valid command.\n").to_stdout }
      end
    end
  end

  context "left" do
    it "should change robot facing from NORTH to WEST" do
      facing = 'NORTH'
      robot.face = facing
      expect{ command.left }.to change{ robot.face }.from( facing ).to( 'WEST' )
    end
  end

  context "right" do
    it "should change robot facing from NORTH to EAST" do
      facing = 'NORTH'
      robot.face = facing
      expect{ command.right }.to change{ robot.face }.from( facing ).to( 'EAST' )
    end
  end

  context "move" do
    context "with valid data" do
      context "should move robot from (1,1) to (1,2) coordinate with NORTH facing" do
        it "should change y coordinade" do
          robot_on_board
          expect{ command.move }.to change{ robot.y }.from( 1 ).to( 2 )
        end

        it "should not change x coordinade" do
          robot_on_board
          expect{ command.move }.not_to change{ robot.x }
        end
      end
    end

    context "with invalid data" do
      before :each do
        robot.x = 10
        robot.y = 10
        robot.face = 'NORTH'
      end

      it "should print 'x, y coordinates are not on board' message" do
        expect{ command.move }.to output("x, y coordinates are not on board. Please enter valid command.\n").to_stdout
      end
      it "should return false" do
        expect( command.move ).to eq(false)
      end
    end
  end
end
