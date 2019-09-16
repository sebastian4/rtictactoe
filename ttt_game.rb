require "./ttt_board"
require "./ttt_player"

module TTTGame

    include TTTBoard
    include TTTPlayer

    class TicTacToeGame

        attr_accessor :loops, :winner, :player_x, :player_o, :board

        def initialize(board, player_x, player_o)
            @board = board
            @player_x = player_x
            @player_o = player_o
            @current_player = @player_x
        end

        def play
            print "============ start tictactoe game\n"
            @loops = 0
            loop do
                @board.render
                @current_player.get_coordinates
                break if check_game_over
                switch_players
                @loops += 1
                @winner = @current_player
            end
        end

        # check for victory or draw
        def check_game_over
            check_victory || check_draw
        end

        def check_victory
            # current player's piece has a winning combination?
            if @board.winning_combination?(@current_player.piece)
                puts "\n#{@current_player.name} Has Won!"
                @board.render
                true
            else
                false
            end
        end

        # check if board is full
        def check_draw
            if @board.full?
                puts "Draw"
                @board.render
                true
            else
                false
            end
        end

        def switch_players
            if @current_player == @player_x
                @current_player = @player_o
            else
                @current_player = @player_x
            end
        end

    end

end 
