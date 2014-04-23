class Cell 
  attr_accessor :pos_x, :pos_y, :value

  def initialize(pos_x, pos_y, value)
    @pos_x = pos_x
    @pos_y = pos_y
    @value = value
  end
end