require './player.rb'
require './board.rb'

class TicTacToe
    attr_reader :tic_tac_toe_board, :player1, :player2, :current_player
  
    def initialize
      @tic_tac_toe_board = Board.new
    end
  
    def start_game
      puts "\nAlright, an oldie but goodie here for you: Tic Tac Toe. I bet you\n" \
            "know how to play this one, but if you don't,\n" \
            "just ask the person right next to you. Good luck!"
      assign_player_one
      assign_player_two
      puts "\nPhew! That was a lot of work, lets get to the fun stuff!"
      puts "Here's what your starting board looks like:"
      tic_tac_toe_board.print_board
      game_loop
    end
  
    def assign_player_one  
      puts "\nFirst Player, please enter your name"
      name_player1 = gets.chomp
      puts "\nOkay #{name_player1}, now pick a non-numeric symbol to mark your moves"
      token_player1 = gets.chomp
      @player1 = Player.new(name_player1, token_player1)
      @current_player = player1
    end
  
    def assign_player_two
      puts "\nSecond player, please enter your name"
      name_player2 = gets.chomp
      puts "\nOkay #{name_player2}, now pick a non-numeric symbol to mark your moves"
      token_player2 = gets.chomp
      @player2 = Player.new(name_player2, token_player2)
    end
  
    def available_positions?
      tic_tac_toe_board.board.flatten.any?(Integer)
    end
  
    def change_player
      current_player == player1 ? player2 : player1
    end
  
    def move
      until tic_tac_toe_board.move_allowed?(current_player.player_move)
        puts "That doesn't look like an available number on the board,\nplease pick again"
      end
      move = current_player.player_selection
      move
    end
  
    def game_loop
      until player1.player_win?(tic_tac_toe_board) || player2.player_win?(tic_tac_toe_board)
        while available_positions?
          selection = move
          tic_tac_toe_board.update_board(selection, current_player.token)
          tic_tac_toe_board.print_board
          puts game_win_message if current_player.player_win?(tic_tac_toe_board)
          break if current_player.player_win?(tic_tac_toe_board)
          @current_player = change_player
          puts tie_game_message unless available_positions?
        end
      break unless available_positions?
      end
    end

    def game_win_message
        "Well played, #{current_player.player_name}. You won the game!"
    end

    def tie_game_message
        "Ah shucks! Cats game! Better luck next time."
    end
  end

  TicTacToe.new.start_game
  