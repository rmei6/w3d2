class ComputerPlayer
  def initialize
    @known_cards = Hash.new {|value,position| value[position] = []}
    @matched_cards = []
  end

  def get_input(positions)
    known = @known_cards.values.select {|card| card.length == 2}
    if known
      @known_cards.delete(@known_cards.key(known))
      if positions.include?(known.first)
        return known.first 
      else
        return known.last
      end
    else
      positions.sample
    end
  end
end