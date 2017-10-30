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
    # since origin refers to the vertex at which the object is initialized, all other vertices are a combination of the x/y/z values of the origin and the x/y/z values of the origin added to their corresponding dimensions.
    x_vals, y_vals, z_vals = [@origin.x, @origin.x + @height], [@origin.y, @origin.y + @width], [@origin.z, @origin.z + @length]
    # create all possible combinations based on 2 possible values of each x, y, and z
    vertices_formulaes = x_vals.product(y_vals, z_vals)
    # create vertex objects from the array
    vertices_list = vertices_formulaes.map{|vertex| Vertex.new({'x' => vertex[0], 'y' => vertex[1], 'z' => vertex[2]})}
    return vertices_list
  end

  def intersects?(other)
    # This method utilizes a mathematical principle for determining whether 2 ranges overlap within each axis. 
    # The primary principle is that in order for an overlap to exist, atleast 1 value (the min or the max) of an object must be between the min and max of the other object.
    # To do this, we are creating 2 subarrays within an array. 
    # Each of these subarrays represents one of the two orders in which the above principle is not demonstrated, thus making intersection impossible.
    extreme_vertices = [[@origin, vertices.last, other.origin, other.vertices.last],[other.origin, other.vertices.last, @origin, vertices.last]]
    # In each of the following lines, we are mapping over the array and the subarrays to obtain an array with two subarrays containing the x/y/z values of the origin and the furthest point from the origin (i.e. the range of each object with respect to that dimension).
    x_lists = extreme_vertices.map{|list| list.map{|vertex| vertex.x}}
    y_lists = extreme_vertices.map{|list| list.map{|vertex| vertex.y}}
    z_lists = extreme_vertices.map{|list| list.map{|vertex| vertex.z}}
    # We are checking that the overlap condition holds true for each axis. 
    # We do this by using a sorted version of each subarray. 
    # A sorted subarray matching either of the subarrays defined in exteme_vertices means intersection is impossible.
    return !(x_lists.include?(x_lists.first.sort) || y_lists.include?(y_lists.first.sort) || z_lists.include?(z_lists.first.sort))
  end

  def rotate!
    # based on our definition of the origin, using this method of rotation prevents you from hitting a wall since each origin axis cannot be negative. 
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
    # dimensions must be non-negative integers
    dimensions = {'length' => params['length'], 'width' => params['width'], 'height' => params['height']}
    dimensions.each {|k,v| raise "Invalid input type (#{v}). #{k} must be a positive integer" if !((v.is_a? Integer) && v > 0)}
  end

  def params_check(params)
    keys_check(params)
    dimensions_check(params)
  end
end
