
module TTTBoard

    class Board

        def initialize
            # initialize empty board
            @board = Array.new(3){Array.new(3)}
        end

        def deep_copy
            new_board = Board.new
            new_inner_board = Array.new(3){Array.new(3)}
            idx = 0
            @board.each do |row|
                new_inner_board[idx] = row.dup
                idx += 1
            end
            new_board.set_board(new_inner_board)
            return new_board
        end

        def set_board(board)
            @board = board
        end

        # render the board
        def render
            print("\n    A   B   C \n")
            print("  +---+---+---+\n")
            idx = 1
            @board.each do |row|
                print(idx.to_s+" | ")
                row.each do |cell|
                    cell.nil? ? print("- ") : print(cell.to_s+" ")
                    print("| ")
                end
                puts
                idx += 1
            end
            print("  +---+---+---+\n\n")
        end

        def coords_to_standard(coords)
            standar = []
            standar.push( num_to_letter(coords[1]) )
            standar.push( coords[0]+1 )
            standar
        end

        def num_to_letter(num)
            if num == 0
                'A'
            elsif num == 1
                'B'
            elsif num == 2
                'C'
            else
                'D'
            end
        end

        def add_piece(coords, piece)
            # if piece_location_valid?
            if piece_location_valid?(coords)
                # place piece
                puts coords_to_standard(coords).to_s 
                @board[coords[0]][coords[1]] = piece
                true
            else
                puts coords_to_standard(coords).to_s + " : there is already a piece there!"
                false
            end
        end

        def add_piece_quiet(coords, piece)
            if piece_location_valid?(coords)
                @board[coords[0]][coords[1]] = piece
                true
            else
                false
            end
        end

        # is the location_valid?
        def piece_location_valid?(coords)
            # is the placement ok? valid and available?
            if within_valid_coordinates?(coords)
                # Are the piece coordinates available?
                valid = coordinates_available?(coords)
            end
        end

        # within_valid_coordinates? from 0 to 2
        def within_valid_coordinates?(coords)
            # piece coords are in the acceptible range
            if (0..2).include?(coords[0]) && (0..2).include?(coords[1])
                true
            else
                # display an error message
                puts "Piece coordinates are out of bounds"
            end
        end

        # are those coordinates available? or are the filled
        def coordinates_available?(coords)
            return @board[coords[0]][coords[1]].nil?
        end

        # winning combination?
        def winning_combination?(piece)
            # is there a winning combo?
            winning_diagonal?(piece)   || 
            winning_horizontal?(piece) || 
            winning_vertical?(piece)
        end

        def winning_diagonal?(piece)
            # check if specified piece has a triplet across diagonals
            diagonals.any? do |diag|
                diag.all?{|cell| cell == piece }
            end
        end

        def winning_vertical?(piece)
            # check if specified piece has a triplet across verticals
            verticals.any? do |vert|
                vert.all?{|cell| cell == piece }
            end
        end

        def winning_horizontal?(piece)
            # check if specified piece has a triplet across horizontals
            horizontals.any? do |horz|
                horz.all?{|cell| cell == piece }
            end
        end

        def diagonals
            # return the diagonal pieces in array
            [[ @board[0][0],@board[1][1],@board[2][2] ],
                [ @board[2][0],@board[1][1],@board[0][2] ]]
        end

        def verticals
            # return the vertical pieces
            verticals = []
            3.times do |i|
                verticals << [@board[i][0],@board[i][1],@board[i][2]]
            end
            verticals
        end

        def horizontals
            # return the horizontal pieces
            horizontals = []
            3.times do |i|
                horizontals << [@board[0][i],@board[1][i],@board[2][i]]
            end
            horizontals
        end

        def full?
            # does every square contain a piece?
            @board.all? do |row|
                row.none?(&:nil?)
            end
        end

    end

end 
