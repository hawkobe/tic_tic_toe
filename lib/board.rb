class Board
    attr_reader :board, :board_start, :board_end
  
    def initialize
      @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    end
  
    def print_board
      puts "\n
      #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}
      --|---|--
      #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]}
      --|---|--
      #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]}
      \n"
    end
  
    def column(number)
      new_column = []
      @board.each { |elem| new_column << elem[number - 1] }
      new_column
    end
  
    def row(number)
      row = @board[number - 1]
      row
    end
  
    def diagonal_row_top_right
      diagonal_row = []
      i = @board.length - 1
      while i > 0
        @board.each do |row|
          diagonal_row << row[i]
          i -= 1
        end
      end
      diagonal_row
    end
  
    def diagonal_row_bottom_right
      diagonal_row = []
      i = 0
      while i < @board.length
        @board.each do |row|
          diagonal_row << row[i]
          i += 1
        end
      end
      diagonal_row
    end
  
    def column_win?(token)
      i = 1
      while i <= @board.length
        if self.column(i).all?(token) 
          return true
        end
        
        i += 1
      end
    end
  
    def row_win?(token)
      i = 1
      while i <= @board.length
        if self.row(i).all?(token)
          return true
        end
        i += 1
      end
    end
  
    def diagonal_win?(token)
      self.diagonal_row_bottom_right.all?(token) || self.diagonal_row_top_right.all?(token)
    end
  
    def update_board(player_selection, token)
      @board.each do |array|
        if array.include?(player_selection)
          index = array.index(player_selection)
          array[index] = token
        end
      end
    end
  
    def move_allowed?(player_selection)
      return true if board.flatten.include?(player_selection)
    end
  end
  