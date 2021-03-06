require 'cuboid'

describe Cuboid do
  let(:cuboid) {Cuboid.new({'x'=> 0,'y'=> 1, 'z'=> 2, 'length' => 5, 'height' => 6, 'width' => 7})}
  
  context "#initialize" do
    it "creates a Cuboid object" do
      expect(cuboid).to be_an_instance_of Cuboid
    end

    it "requires parameters" do
      expect{Cuboid.new}.to raise_error(RuntimeError)
    end

    it "requires positive integers as dimension parameters" do
      expect{Cuboid.new({'x'=> 0,'y'=> 1, 'z'=> 2, 'length' => 0, 'height' => 5, 'width' => 5})}.to raise_error(RuntimeError)
      expect{Cuboid.new({'x'=> 0,'y'=> 1, 'z'=> 2, 'length' => -1, 'height' => 5, 'width' => 5})}.to raise_error(RuntimeError)
      expect{Cuboid.new({'x'=> 0,'y'=> 1, 'z'=> 2, 'length' => 5, 'height' => 0, 'width' => 5})}.to raise_error(RuntimeError)
      expect{Cuboid.new({'x'=> 0,'y'=> 1, 'z'=> 2, 'length' => 5, 'height' => -1, 'width' => 5})}.to raise_error(RuntimeError)
      expect{Cuboid.new({'x'=> 0,'y'=> 1, 'z'=> 2, 'length' => 5, 'height' => 5, 'width' => 0})}.to raise_error(RuntimeError)
      expect{Cuboid.new({'x'=> 0,'y'=> 1, 'z'=> 2, 'length' => 5, 'height' => 5, 'width' => -1})}.to raise_error(RuntimeError)
    end    
  end

  context "#origin" do
    it "returns a Vertex object" do
      expect(cuboid.origin).to be_an_instance_of Vertex
    end

    it "returns a Vertex with values matching initialization parameters" do
      expect(cuboid.origin.x == 0).to be true
      expect(cuboid.origin.y == 1).to be true
      expect(cuboid.origin.z == 2).to be true
    end

    it "cannot be directly modified" do
      expect{cuboid.origin = Vertex.new({'x'=> 0,'y'=> 1, 'z'=> 2})}.to raise_error(NoMethodError)
    end
  end

  context "#length" do
    it "returns the length value" do
      expect(cuboid.length).to eq 5
    end

    it "cannot be directly modified" do
      expect{cuboid.length = 1}.to raise_error(NoMethodError)
    end
  end

  context "#width" do
    it "returns the width value" do
      expect(cuboid.width).to eq 7
    end

    it "cannot be directly modified" do
      expect{cuboid.width = 1}.to raise_error(NoMethodError)
    end
  end 

  context "#height" do
    it "returns the height value" do
      expect(cuboid.height).to eq 6
    end

    it "cannot be directly modified" do
      expect{cuboid.height = 1}.to raise_error(NoMethodError)
    end
  end

  context "#move_to!" do
    it "requires parameters" do
      expect{cuboid.move_to!}.to raise_error(ArgumentError)
    end

    it "changes the origin" do
      cuboid.move_to!(0,1,2)
      expect(cuboid.origin.x).to eq 0
      expect(cuboid.origin.y).to eq 1
      expect(cuboid.origin.z).to eq 2
    end
  end

  context "#vertices" do
    it "returns a list" do
      expect(cuboid.vertices).to be_an_instance_of Array
    end

    it "returns a list of Vertex objects" do
      expect(cuboid.vertices.first).to be_an_instance_of Vertex
    end

    it "returns a list that contains 8 objects" do
      expect(cuboid.vertices.length).to eq 8
    end
  end

  context "#intersects?" do
    let(:cuboid_one) {Cuboid.new({'x'=> 1,'y'=> 1, 'z'=> 1, 'length' => 5, 'height' => 6, 'width' => 7})}  
    let(:cuboid_two) {Cuboid.new({'x'=> 2,'y'=> 2, 'z'=> 0, 'length' => 2, 'height' => 2, 'width' => 10})}
    let(:cuboid_three) {Cuboid.new({'x'=> 20,'y'=> 2, 'z'=> 0, 'length' => 2, 'height' => 2, 'width' => 10})}
    it "returns true if the object and the provided object intersect" do
        expect(cuboid_one.intersects?(cuboid_two)).to be true  
        expect(cuboid_two.intersects?(cuboid_one)).to be true  
    end

    it "returns false if the object and the provided object do not intersect" do
        expect(cuboid_one.intersects?(cuboid_three)).to be false
        expect(cuboid_three.intersects?(cuboid_one)).to be false
    end
  end

  context "#rotate!" do
    it "swaps width and length values" do
      cuboid.rotate!
      expect(cuboid.width).to eq  5
      expect(cuboid.length).to eq 7
    end
  end

  context "#rotate2!" do
    it "swaps width and height values" do
      cuboid.rotate2!
      expect(cuboid.width).to eq 6
      expect(cuboid.height).to eq 7
    end
  end

  context "#rotate3!" do
    it "swaps length and height values" do
      cuboid.rotate3!
      expect(cuboid.length).to eq 6
      expect(cuboid.height).to eq 5
    end
  end

  context "#to_s" do
    it "prints the Cuboid as a formatted string" do
      expect{print cuboid}.to output("A 3-dimensional object with an origin at (0,1,2) with a width of 7, length of 5, and height of 6.").to_stdout
    end
  end
end
