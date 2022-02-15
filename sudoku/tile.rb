require_relative "colorize"

class Tile
  attr_reader :given,:value
  def initialize(value,given)
    @value = value
    @value = @value.to_s.colorize(:blue) if given
    @given = given
  end
end