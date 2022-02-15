require_relative "card"
class Board
  attr_reader :grid
  def initialize(size)
    @size = size
    @grid = Array.new(size) {Array.new(size," ")}
  end

  def random_values
    pairs = (@size ** 2) / 2
    cards = []
    values = ("A".."Z").to_a
    count = 0
    while count < pairs
      value = values.sample
      unless cards.include?(value)
        cards << value 
        count += 1
      end
    end
    cards
  end

  def populate
    cards = random_values
    positions = available_positions
    cards.each do |card|
      2.times do 
        position = positions.sample
        @grid[position[0]][position[1]] = Card.new(card, position)
        positions.delete(position)
      end
    end
    true
  end

  def available_positions
    positions = []
    (0...@size).each do |row|
      (0...@size).each do |col|
        positions << [row, col]
      end
    end
    positions
  end

  def render
    puts "  " + ("0"...@size.to_s).to_a.join(" ")
    (0...@size).each do |row|
      puts "#{row} " + @grid[row].map {|card| 
      if card.face_up  
        card.value
      else
        " "
      end
    }.join(" ")
    end
  end

  def won?
    @grid.all? {|row| row.all? {|card| card.face_up} }
  end

  def reveal(guess_position)
    row,col = guess_position
    @grid[row][col].reveal
    @grid[row][col].value
  end

end