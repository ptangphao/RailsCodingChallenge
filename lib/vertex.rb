class Vertex

  REQUIRED_COORDINATES = ['x','y','z']

  attr_reader :x, :y, :z

  def initialize(params = {})
    # params_check(params)
    @x, @y, @z = params['x'], params['y'], params['z']
  end
end