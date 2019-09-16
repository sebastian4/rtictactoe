require "./ttt_player"

module TTTPlayerCompLv1

    include TTTBoard
    include TTTPlayer

    class PlayerCompLv1 < Player

        def ask_for_coordinates
            input = get_random_pos
        end

        def get_random_pos
            x = rand(0..2)
            y = rand(0..2)
            return [x, y]
        end

    end

end
