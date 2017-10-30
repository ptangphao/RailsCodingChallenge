require 'cuboid'

describe Cuboid do
  let(:cuboid) {Cuboid.new({'x'=> 0,'y'=> 1, 'z'=> 2, 'length' => 5, 'height' => 5, 'width' => 5})}
  
  context "#initialize" do
  end

  context "#move_to!" do
  end

  context "#vertices"
  end

  context "#intersects?" do
  end

  context "#rotate!" do
  end

  context "#rotate2!" do
  end

  context "#rotate3!" do
  end

  context "#to_s" do
  end
  describe "move_to" do
    it "changes the origin in the simple happy case" do
      expect(subject.move_to!(1,2,3)).to be true
    end
  end    
  
end
