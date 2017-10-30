require 'vertex'

describe Vertex do
  let(:vertex) {Vertex.new({'x'=> 0,'y'=> 1, 'z'=> 2})}
  
  context "#initialize" do   
    it "creates a Vertex object" do
      expect(vertex).to be_an_instance_of Vertex 
    end

    it "requires parameters" do
      expect{Vertex.new}.to raise_error(RuntimeError)
    end

    it "requires non-negative integers as parameters" do
      expect{Vertex.new({'x'=> -1,'y'=> 0, 'z'=> 0})}.to raise_error(RuntimeError)
      expect{Vertex.new({'x'=> 0,'y'=> -1, 'z'=> 0})}.to raise_error(RuntimeError)
      expect{Vertex.new({'x'=> 0,'y'=> 0, 'z'=> -1})}.to raise_error(RuntimeError)
    end
  end

  context "#x" do
    it "returns the x-axis value" do
      expect(vertex.x).to eq 0
    end

    it "cannot be directly modified" do
      expect{vertex.x = 4}.to raise_error(NoMethodError)
    end
  end

  context "#y" do
    it "returns the y-axis value" do
      expect(vertex.y).to eq 1
    end

    it "cannot be directly modified" do
      expect{vertex.y = 4}.to raise_error(NoMethodError)
    end
  end

  context "#z" do
    it "returns the z-axis value" do
      expect(vertex.z).to eq 2
    end

    it "cannot be directly modified" do
      expect{vertex.z = 4}.to raise_error(NoMethodError)
    end
  end

  context "#move!" do
    it "requires parameters" do
      expect{vertex.move!}.to raise_error(ArgumentError)
    end

    it "requires non-negative integers as parameters" do
      expect{vertex.move!(3,4,5)}.to_not raise_error
      expect{vertex.move!(-3,4,5)}.to raise_error(RuntimeError)
    end

    it "moves the x-axis value" do
      vertex.move!(3,4,5)
      expect(vertex.x).to eq 3
    end

    it "moves the y-axis value" do
      vertex.move!(3,4,5)
      expect(vertex.y).to eq 4
    end

    it "moves the z-axis value" do
      vertex.move!(3,4,5)
      expect(vertex.z).to eq 5
    end
  end

  context "#to_s" do
    it "prints the Vertex as a formatted string" do
      expect{print vertex}.to output('(0,1,2)').to_stdout
    end
  end
end