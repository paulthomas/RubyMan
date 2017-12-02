require 'colorize'

class Board

  @board
  @star_count
  PLAYER_COLOR_CONST = :yellow
  WALL_COLOR_CONST = :red
  STAR_COLOR_CONST = :green

  # Creates an array with the specified size
  
  def initialize(size)
    @board = Array.new(size) {Array.new(size){ '*' } }
	@star_count = size*size -2 #only temporary. should be dynamically counted during level build. -2 because on the default board you override two with a wall and the player.
  end

  # Draw board in terminal
  
  def draw
    row = 0
    # Repeats the proces n times so as to print every row in the array
    @board.size.times do
      col = 0
      @board[row].size.times do 

        # color the player icon
        # Creates spacing between each item so it looks nicer
		
        if @board[row][col] == 'A'
          print @board[row][col].colorize(PLAYER_COLOR_CONST) + '  ' 
        elsif @board[row][col] == '#'
          print @board[row][col].colorize(WALL_COLOR_CONST) + '  '
        elsif @board[row][col] == '*'
          print @board[row][col].colorize(STAR_COLOR_CONST) + '  '
        elsif @board[row][col] == ' '
          print @board[row][col] + '  '
        end
        col += 1

      end
      puts
      row += 1
    end
    puts "\nPress 'q' to exit or the WASD keys to move"
  end

  # Returns the current board array
  
  def get_board
    @board
  end

  #gets the total number of stars originally on the board
  def star_count
	@star_count
  end
  
  #sets the total number of stars originally on the board
  def star_count=(count)
	@star_count = count
  end
  
  # Sets the board array
  
  def set_board(board)
    @board = board
  end
  

  # This method will be removed once the boards are loaded from an external file

  # Sets obstacle
  
  def set_obstacle(y, x)
    @board[y][x] = '#'
  end

end
