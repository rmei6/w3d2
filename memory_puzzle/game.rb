require_relative "board"
require_relative "human_player"

class Game
  def initialize(size)
    @board = Board.new(size)
    @previous_guess = nil
    @human_player = HumanPlayer.new()
    @ai = @human_player.prompt
    @current_player = @human_player

  end



  def play
    @board.populate
    until @board.won?
      @board.render
      if @previous_guess == nil
        print "Enter a first guess Ex. 1 2: " 
      else
        print "Enter a second guess Ex. 1 2: " 
      end
      positions = @board.available_positions
      position = @current_player.get_input(positions)
      make_guess(position)
    end
    puts "You Won!!!"
  end

  def make_guess(position)
    if @previous_guess == nil
      @board.reveal(position)
      @previous_guess = position
    else
      @board.reveal(position)
      if @board[position] != @board[@previous_guess]
        @board.render
        sleep(1)
        system("clear")
        @board.[](position).hide
        @board.[](@previous_guess).hide
      else
        puts "You made a pair!"
      end
      @previous_guess = nil
    end
  end



end