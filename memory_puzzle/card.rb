class Card
  attr_reader :value,:face_up
  def initialize(value,pos)
    @value = value
    @face_up = false
    @pos = pos
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def to_s
    @value.to_s
  end

  def ==(another_card)
    self.value == another_card.value
  end
end