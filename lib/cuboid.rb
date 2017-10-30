class Cuboid
  
  REQUIRED_PARAMETERS = ['x', 'y', 'z', 'length', 'width', 'height']
  
  attr_reader :origin, :length, :width, :height

  def initialize(params = {})
    # params_check(params)
    @origin = Vertex.new('x' => params['x'], 'y' => params['y'], 'z' => params['z'])
    @length = params['length']
    @width = params['width']
    @height = params['height']
  end
end
