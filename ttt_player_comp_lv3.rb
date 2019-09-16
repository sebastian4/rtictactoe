require "./ttt_player"

module TTTPlayerCompLv3

    include TTTBoard
    include TTTPlayer

    class PlayerCompLv3 < Player

        def ask_for_coordinates
            new_board = @board.deep_copy
            best_move = minimax(new_board)
            # puts best_move
            input = best_move["pos"]
            return input
        end

        def get_random_pos
            x = rand(0..2)
            y = rand(0..2)
            return [x, y]
        end

        def minimax(board)
            best_move = { "utility" => -1000, "pos" => [-1,-1] }
            for i in 0..2 do
              for j in 0..2 do
                coords = [i, j]
                if board.coordinates_available?(coords)
                    new_board = board.deep_copy
                    new_board.add_piece_quiet(coords, @piece)
                    move = min_val(new_board)
                    # puts coords.to_s + " " + move.to_s
                    if move > best_move["utility"]
                        best_move["utility"] = move
                        best_move["pos"] = [i, j]
                    end
                end
              end
            end
            return best_move
        end

        def min_val(board)
            stat = calculate_min_stat(board)
            if stat != 10
                return stat
            end
            utility = 1000
            for i in 0..2 do
                for j in 0..2 do
                    coords = [i, j]
                    if board.coordinates_available?(coords)
                        new_board = board.deep_copy
                        new_board.add_piece_quiet(coords, @piece)
                        move = max_val(new_board)
                        if move < utility
                            utility = move
                        end
                    end
                end
            end
            return utility
        end

        def max_val(board)
            stat = calculate_max_stat(board)
            if stat != 10
                return stat
            end
            utility = -1000
            for i in 0..2 do
                for j in 0..2 do
                    coords = [i, j]
                    if board.coordinates_available?(coords)
                        new_board = board.deep_copy
                        new_board.add_piece_quiet(coords, @piece)
                        move = min_val(new_board)
                        if move > utility
                            utility = move
                        end
                    end
                end
            end
            return utility
        end

        def calculate_min_stat(board)
            if board.winning_combination?(@piece)
                return 1
            elsif board.full?
                return 0
            elsif board.winning_combination?(@opposite_piece)
                return -1
            else 
                return 10
            end
        end

        def calculate_max_stat(board)
            if board.winning_combination?(@piece)
                return -1
            elsif board.full?
                return 0
            elsif board.winning_combination?(@opposite_piece)
                return 1
            else 
                return 10
            end
        end
        
    end

end
