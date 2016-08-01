require 'board'

describe Board do

  context "valid_coordinates? " do
    context "with invalid data should return false " do
      context "with 'x or y coordinate is not a number' message" do
        it { expect( Board.valid_coordinates? nil ).to eq( false ) }
        it { expect{ Board.valid_coordinates? nil }.to output("x or y coordinate is not a number. Please enter valid command.\n").to_stdout }

        it { expect( Board.valid_coordinates? [] ).to eq( false ) }
        it { expect{ Board.valid_coordinates? [] }.to output("x or y coordinate is not a number. Please enter valid command.\n").to_stdout }

        it { expect( Board.valid_coordinates? [ "", "" ] ).to eq( false ) }
        it { expect{ Board.valid_coordinates? [ "", "" ] }.to output("x or y coordinate is not a number. Please enter valid command.\n").to_stdout }

        it { expect( Board.valid_coordinates? [ "a", "b" ] ).to eq( false ) }
        it { expect{ Board.valid_coordinates? [ "a", "b" ] }.to output("x or y coordinate is not a number. Please enter valid command.\n").to_stdout }
      end

      context "with 'x, y coordinates are not on board' message" do
        it { expect( Board.valid_coordinates? [ "-1", "0" ] ).to eq( false ) }
        it { expect{ Board.valid_coordinates? [ "-1", "0" ] }.to output("x, y coordinates are not on board. Please enter valid command.\n").to_stdout }

        it { expect( Board.valid_coordinates? [ "0", "-1" ] ).to eq( false ) }
        it { expect{ Board.valid_coordinates? [ "0", "-1" ] }.to output("x, y coordinates are not on board. Please enter valid command.\n").to_stdout }

        it { expect( Board.valid_coordinates? [ "5", "5" ] ).to eq( false ) }
        it { expect{ Board.valid_coordinates? [ "5", "5" ] }.to output("x, y coordinates are not on board. Please enter valid command.\n").to_stdout }
      end
    end

    context "with valid data should return true " do
      it { expect( Board.valid_coordinates? [ "0", "0" ] ).to eq( true ) }
      it { expect( Board.valid_coordinates? [ "1", "2" ] ).to eq( true ) }
      it { expect( Board.valid_coordinates? [ "4", "4" ] ).to eq( true ) }
    end
  end
end
