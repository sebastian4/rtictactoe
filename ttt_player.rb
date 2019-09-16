require "./ttt_board"

module TTTPlayer

    include TTTBoard

    class Player

        attr_accessor :name, :piece

        def initialize(name = "player 1", piece, board)
            @name = name
            @piece = piece
            @opposite_piece = (@piece == :X) ? :O : :X
            @board = board
        end

        def get_coordinates
            loop do
                coords = ask_for_coordinates
                print( @name +": " )
                # print( @name +": "+ coords.to_s )
                puts
                # validate if coordinates format is correct
                if validate_coordinates_format(coords)
                    # check piece can be placed on board
                    if @board.add_piece(coords, @piece)
                        break
                        # if yes, then player is done
                    end
                end
            end
        end

        def ask_for_coordinates
            puts "#{@name}(#{@piece}), where do you want to move (eg. B1,A3) :"
            input = gets
            new_input = transform_coordinates(input)
        end

        def transform_coordinates(input)
            array = []
            chars = input.split('')
            reversed = false
            chars.each { |c|
                if ((c == 'A' || c == 'B' || c == 'C') && array.length == 0)
                    reversed = true
                end
                if (c == 'A' || c == '1')
                    array.push(0)
                elsif (c == 'B' || c == '2')
                    array.push(1)
                elsif (c == 'C' || c == '3')
                    array.push(2)
                end 
            }
            array = fix_array(array, reversed)
            return array
        end

        def fix_array(array, reversed)
            if reversed
                temp = array[0]
                array[0] = array[1]
                array[1] = temp
            end
            return array
        end

        def validate_coordinates_format(coords)
            if coords.is_a?(Array) && coords.size == 2
                true
            else
                puts "Your coordinates are not in a proper format!"
                false
            end
        end

    end

end 
