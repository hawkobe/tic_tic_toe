class Player
    attr_reader :token, :player_name, :player_selection
  
    def initialize(player_name, token)
      @player_name = player_name
      @token = token
    end
  
    def player_move
      puts "\n#{@player_name}, please select an available number to place your move"
      @player_selection = gets.chomp.to_i 
    end
  
    def player_win?(board)
      board.column_win?(token) || board.row_win?(token) || board.diagonal_win?(token)
    end
  end
  