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
      expect(cuboid.origin.x = 0).to be_true
      expect(cuboid.origin.y = 1).to be_true
      expect(cuboid.origin.z = 2).to be_true
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
      expect(cuboid.width).to eq 6
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
    cuboid.move_to!(0,0,0)
    it "requires parameters" do
      expect{cuboid.move_to!}.to raise_error(ArgumentError)
    end

    it "changes the origin" do
      expect(cuboid.origin.x).to eq 0
      expect(cuboid.origin.y).to eq 0
      expect(cuboid.origin.z).to eq 0
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
  end

  context "#rotate!" do
  end

  context "#rotate2!" do
  end

  context "#rotate3!" do
  end

  context "#to_s" do
  end
end
