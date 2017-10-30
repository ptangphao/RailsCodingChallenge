class Cuboid
  
  REQUIRED_PARAMETERS = ['x', 'y', 'z', 'length', 'width', 'height']
  
  attr_reader :origin, :length, :width, :height

  def initialize(params = {})
    params_check(params)
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

  def intersects?(other)
    extreme_vertices = [[@origin, vertices.last, other.origin, other.vertices.last],[other.origin, other.vertices.last, @origin, vertices.last]]
    x_lists = extreme_vertices.map{|list| list.map{|vertex| vertex.x}}
    y_lists = extreme_vertices.map{|list| list.map{|vertex| vertex.y}}
    z_lists = extreme_vertices.map{|list| list.map{|vertex| vertex.z}}
    return !(x_lists.include?(x_lists.first.sort) || y_lists.include?(y_lists.first.sort) || z_lists.include?(z_lists.first.sort))
  end

  def rotate!
    @width, @length = @length, @width
  end

  def rotate2!
    @width, @height = @height, @width
  end

  def rotate3!
    @length, @height = @height, @length
  end

  def to_s
    "A 3-dimensional object with an origin at #{self.origin.to_s} with a width of #{self.width}, length of #{self.length}, and height of #{self.height}."
  end

  private

  def keys_check(params)
    REQUIRED_PARAMETERS.each{|k| raise "Missing required parameter: #{k}" if !params.keys.include?(k)}
  end
  
  def dimensions_check(params)
    dimensions = {'length' => params['length'], 'width' => params['width'], 'height' => params['height']}
    dimensions.each {|k,v| raise "Invalid input type (#{v}). #{k} must be a positive integer" if !((v.is_a? Integer) && v > 0)}
  end

  def params_check(params)
    keys_check(params)
    dimensions_check(params)
  end
end
