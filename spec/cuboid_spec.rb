require 'cuboid'

describe Cuboid do
  let(:cuboid) {Cuboid.new({'x'=> 0,'y'=> 1, 'z'=> 2, 'length' => 5, 'height' => 5, 'width' => 5})}
  
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
      expect{cuboid.origin = Vertex.new({'x'=> 0,'y'=> 1, 'z'=> 2}}.to raise_error(NoMethodError)
    end
  end

  context "#length" do
    
  end

  context "#width" do
  end 

  context "#height" do
  end

  context "#move_to!" do
  end

  context "#vertices" do
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
