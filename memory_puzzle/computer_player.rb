class ComputerPlayer
  def initialize
    @known_cards = Hash.new {|value,position| value[position] = []}
    @matched_cards = []
  end

  def get_input(positions)
    if @matched_cards.length > 0
      matched = @matched_cards.first
      if positions.include?(matched.first)
        return matched.first 
      else
        return matched.last
      end
    else
      positions.sample
    end
  end

  #check if match
  #if match return match
  #else make guess and give to recieve revelead
  #call check_match

  def receive_revealed_card(position, value)
    @known_cards[value] << position
  end

  def check_match
    @known_cards.values.each {|card| @matched_cards << card if card.length == 2}
    @known_cards.delete(@known_cards.key(@matched_cards[0]))
  end
end