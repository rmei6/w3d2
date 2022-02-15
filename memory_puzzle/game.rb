require_relative "board"

class Game
  def initialize(size)
    @board = Board.new(size)
    @previous_guess = nil
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
      position = gets.chomp
      position = position.split(" ").map! { |char| char.to_i}
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