class Vertex

  REQUIRED_COORDINATES = ['x','y','z']

  attr_reader :x, :y, :z

  def initialize(params = {})
    params_check(params)
    @x, @y, @z = params['x'], params['y'], params['z']
  end

  def move!(x,y,z)
    destination_check(x,y,z)
    @x, @y, @z = x, y, z
  end

  def to_s
    "(#{self.x},#{self.y},#{self.z})"
  end

  private

  def required_params(params)
    REQUIRED_COORDINATES.each{|k| raise "Missing required parameter: #{k}" if !params.keys.include?(k)}
  end

  def valid_params(params)
    params.each {|k,v| raise "Invalid input type (#{v}). #{k} must be a non-negative integer" if !((v.is_a? Integer) && v >= 0)}
  end

  def params_check(params)
    required_params(params)
    valid_params(params)
  end

  def destination_check(x,y,z)
    [x,y,z].each {|axis_value| raise "Invalid input type (#{axis_value}). New axis value must be a non-negative integer" if !((axis_value.is_a? Integer) && axis_value >= 0)}
  end
end