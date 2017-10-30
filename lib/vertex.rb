class Vertex

  REQUIRED_COORDINATES = ['x','y','z']

  attr_reader :x, :y, :z

  def initialize(params = {})
    # params_check(params)
    @x, @y, @z = params['x'], params['y'], params['z']
  end

  def move!(x,y,z)
    # destination_check(x,y,z)
    @x, @y, @z = x, y, z
  end

  def to_s
    "(#{self.x},#{self.y},#{self.z})"
  end
end