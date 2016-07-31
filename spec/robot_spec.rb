require 'robot'
require 'byebug'

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
    context "with valid data should return true" do
      it { expect{ robot.set_facing 'NORTH' }.to change{ robot.face }.from( nil ).to( 'NORTH' ) }
      it { expect( robot.set_facing 'NORTH' ).to eq( true ) }
    end

    context "with invalid data should return true" do
      it { expect{ robot.set_facing 'north' }.to output("Facing has not found among permitted attributes. Please enter valid command.\n").to_stdout }
      it { expect{ robot.set_facing 'north' }.to_not change{ robot.face } }
      it { expect( robot.set_facing 'north' ).to eq( false ) }
    end
  end

  context "set_coordinates" do
    context "with valid data" do
      it "should return true" do
        expect( robot.set_coordinates [ "0", "0" ] ).to eq( true )
      end

      context "should change set x, y coordinates" do
        it { expect{ robot.set_coordinates [ "0", "0" ] }.to change{ robot.x }.from( nil ).to( 0 ) }
        it { expect{ robot.set_coordinates [ "0", "0" ] }.to change{ robot.y }.from( nil ).to( 0 ) }
      end
    end
  end
end
