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

  def move_to!(x, y, z)
    @origin.move!(x,y,z)
  end

  def vertices
    x_vals, y_vals, z_vals = [@origin.x, @origin.x + @height], [@origin.y, @origin.y + @width], [@origin.z, @origin.z + @length]
    vertices_formulaes = x_vals.product(y_vals, z_vals)
    vertices_list = vertices_formulaes.map{|vertex| Vertex.new({'x' => vertex[0], 'y' => vertex[1], 'z' => vertex[2]})}
    return vertices_list
  end
end
