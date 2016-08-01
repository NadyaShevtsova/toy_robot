require 'robot'

describe Robot do
  let(:robot) { Robot.new }

  context "valid_facing?" do
    context "with valid data should return true" do
      it { expect( robot.send( "valid_facing?", 'NORTH' )).to eq( true ) }
      it { expect( robot.send( "valid_facing?", 'EAST'  )).to eq( true ) }
      it { expect( robot.send( "valid_facing?", 'SOUTH' )).to eq( true ) }
      it { expect( robot.send( "valid_facing?", 'WEST'  )).to eq( true ) }
    end

    context "with invalid data should return false" do
      it { expect( robot.send( "valid_facing?", nil )).to eq( false ) }
      it { expect( robot.send( "valid_facing?", ''  )).to eq( false ) }
      it { expect( robot.send( "valid_facing?", 'north' )).to eq( false ) }
      it { expect( robot.send( "valid_facing?", 'east'  )).to eq( false ) }
      it { expect( robot.send( "valid_facing?", 'south' )).to eq( false ) }
      it { expect( robot.send( "valid_facing?", 'west'  )).to eq( false ) }
      it { expect( robot.send( "valid_facing?", 'some_string' )).to eq( false ) }
    end
  end

  context "set_facing" do
    context "with valid data should change facing from nil to NORTH" do
      it { expect{ robot.set_facing 'NORTH' }.to change{ robot.face }.from( nil ).to( 'NORTH' ) }
    end

    context "with invalid data should return true" do
      it { expect{ robot.set_facing 'north' }.to output("Facing has not found among permitted attributes. Please enter valid command.\n").to_stdout }
      it { expect{ robot.set_facing 'north' }.to_not change{ robot.face } }
      it { expect( robot.set_facing 'north' ).to eq( false ) }
    end
  end

  context "set_coordinates" do
    context "with valid data should change set x, y coordinates" do
      it { expect{ robot.set_coordinates [ "0", "0" ] }.to change{ robot.x }.from( nil ).to( 0 ) }
      it { expect{ robot.set_coordinates [ "0", "0" ] }.to change{ robot.y }.from( nil ).to( 0 ) }
    end
  end

  context "on_board?" do
    it "should return false if x,y,face are nil" do
      expect( robot.on_board? ).to eq( false )
    end

    it "should return false if x,y,face are not nil" do
      robot.x, robot.y = [ 1, 1 ]
      robot.face = 'NORTH'
      expect( robot.on_board? ).to eq( true )
    end
  end

  context "find_index" do
    it "should return 0" do
      robot.face = 'NORTH'
      expect( robot.send "find_index" ).to eq(0)
    end

    it "should return 3" do
      robot.face = 'WEST'
      expect( robot.send "find_index" ).to eq(3)
    end
  end

  context "turn_left" do
    it "should change facing from NORTH to WEST" do
      facing = 'NORTH'
      robot.face = facing
      expect{ robot.turn_left }.to change{ robot.face }.from( facing ).to( 'WEST' )
    end

    it "should change facing from WEST to SOUTH" do
      facing = 'WEST'
      robot.face = facing
      expect{ robot.turn_left }.to change{ robot.face }.from( facing ).to( 'SOUTH' )
    end

    it "should change facing from SOUTH to EAST" do
      facing = 'SOUTH'
      robot.face = facing
      expect{ robot.turn_left }.to change{ robot.face }.from( facing ).to( 'EAST' )
    end

    it "should change facing from EAST to NORTH" do
      facing = 'EAST'
      robot.face = facing
      expect{ robot.turn_left }.to change{ robot.face }.from( facing ).to( 'NORTH' )
    end
  end

  context "turn_right" do
    it "should change facing from NORTH to EAST" do
      facing = 'NORTH'
      robot.face = facing
      expect{ robot.turn_right }.to change{ robot.face }.from( facing ).to( 'EAST' )
    end

    it "should change facing from EAST to SOUTH" do
      facing = 'EAST'
      robot.face = facing
      expect{ robot.turn_right }.to change{ robot.face }.from( facing ).to( 'SOUTH' )
    end

    it "should change facing from SOUTH to WEST" do
      facing = 'SOUTH'
      robot.face = facing
      expect{ robot.turn_right }.to change{ robot.face }.from( facing ).to( 'WEST' )
    end

    it "should change facing from WEST to NORTH" do
      facing = 'WEST'
      robot.face = facing
      expect{ robot.turn_right }.to change{ robot.face }.from( facing ).to( 'NORTH' )
    end
  end
end
