require 'vertex'

describe Vertex do
  let(:vertex) {Vertex.new({'x'=> 0,'y'=> 1, 'z'=> 2})}
  
  context "#initialize" do   
    it "creates a Vertex object" do
      expect(vertex).to be_an_instance_of Vertex 
    end

    it "requires parameters" do
      expect(Vertex.new).to raise_error
    end

    it "requires non-negative integers as parameters" do
      expect(Vertex.new({'x'=> -1,'y'=> 0, 'z'=> 0})).to raise_error
      expect(Vertex.new({'x'=> 0,'y'=> -1, 'z'=> 0})).to raise_error
      expect(Vertex.new({'x'=> 0,'y'=> 0, 'z'=> -1})).to raise_error
    end
  end

  context "#x" do
    it "should return the x-axis value" do
      expect(vertex.x).to eq 0
    end

    it "can not be modified" do
      expect(vertex.x = 4).to raise_error
    end
  end

  context "#y" do
    it "should return the y-axis value" do
      expect(vertex.y).to eq 1
    end

    it "can not be modified" do
      expect(vertex.y = 4).to raise_error
    end
  end

  context "#z" do
    it "should return the z-axis value" do
      expect(vertex.z).to eq 2
    end

    it "can not be modified" do
      expect(vertex.z = 4).to raise_error
    end
  end

  context "#move!" do
  end
  context "#to_s" do
  end
end