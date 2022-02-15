class HumanPlayer
  def initialize

  end

  def prompt
    print "Would you like to play againt an AI? y/n:"
    boolean = gets.chomp
    boolean.downcase == 'y' 
  end


  def get_input(positions)
    position = gets.chomp
    position = position.split(" ").map! { |char| char.to_i}
  end

  def receive_revealed_card(positions, value)

  end

  def check_match

  end
end