require_relative "board"
require_relative "human_player"
require_relative "computer_player"
#require "byebug"

class Game
  def initialize(size)
    @board = Board.new(size)
    @previous_guess = nil
    @human_player = HumanPlayer.new()
    @ai = @human_player.prompt
    @current_player = @human_player
    @computer_player = ComputerPlayer.new()
  end

  def switch
    if @ai
      if @current_player == @computer_player
        @current_player = @human_player
      else
        @current_player = @computer_player
      end
    end
  end

  def play
    @board.populate
    #p @board.grid
    until @board.won?
    #5.times do 
      @board.render
      if @previous_guess == nil
        print "Enter a first guess Ex. 1 2: " 
      else
        print "Enter a second guess Ex. 1 2: " 
      end
      positions = @board.available_positions 
      position = @current_player.get_input(positions)
      @current_player.receive_revealed_card(position, @board[position].value) if @current_player == @computer_player
      @current_player.check_match if @current_player == @computer_player
      if @board[position].face_up
        puts "Card has already been guessed"
      else
        puts "Inputed Position: #{position}"
        make_guess(position)
        switch if @previous_guess == nil
      end
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
        sleep(2)
        #system("clear")
        @board.[](position).hide
        @board.[](@previous_guess).hide
      else
        @board.reveal(position)
        puts "You made a pair!"
        sleep(1)
      end
      @previous_guess = nil
    end
  end



end

game = Game.new(4)
game.play