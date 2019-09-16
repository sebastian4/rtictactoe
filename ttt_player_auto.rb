require "./ttt_player"

module TTTPlayerAuto

    include TTTBoard
    include TTTPlayer

    class PlayerAuto < Player

        def set_auto(player_data)
            @player_data = player_data
            @data_iter = @player_data.each
        end

        def ask_for_coordinates
            input = @data_iter.next
            # puts input
            new_input = transform_coordinates(input)
        end

    end

end
