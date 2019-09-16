require "./ttt_board"
require "./ttt_player"
require "./ttt_player_auto"
require "./ttt_player_comp_lv1"
require "./ttt_player_comp_lv3"
require "./ttt_game"
require "./ttt_mock_data"

include TTTBoard
include TTTPlayer
include TTTPlayerAuto
include TTTPlayerCompLv1
include TTTPlayerCompLv3
include TTTGame
include TTTMockData

module TTTGameFactory

    # auto, if it is automatic
    # level, level of the computer, 1 easy, 2 hard
    # mock_data, if auto, nil if not auto
    def buildTicTacToeGame(auto, level, mock_data)
        getter = Proc.new {}
        if auto
            @@mock_data = mock_data
            getter = Proc.new { @@mock_data.assign }
        else
            getter = Proc.new { gets.to_s }
        end
        @@auto = auto
        @@level = level
        @@board = Board.new
        assign_player(getter)
        @@ttt = TicTacToeGame.new(@@board, @@player_x, @@player_o)
        return @@ttt
    end

    def assign_player(getter)
        
        print("\n\nWhich player do you want to be? X or O?")
        player = getter.call
        puts player
        chars = player.split('')
        if chars[0] == 'X'
            @@player_x = make_player("player x", :X)
            @@player_o = make_computer_player("computer", :O)
        elsif chars[0] == 'O'
            @@player_o = make_player("player o", :O)
            @@player_x = make_computer_player("computer", :X)
        else
            puts "not valid"
        end
    end

    def make_player(name, token)
        if @@auto
            return make_auto_player(name, token)
        else
            return make_normal_player(name, token)
        end
    end

    def make_normal_player(name, token)
        player = Player.new(name, token, @@board)
    end

    def make_auto_player(name, token)
        player = PlayerAuto.new(name, token, @@board)
        player.set_auto(@@mock_data.data)
        player
    end

    def make_computer_player(name, token)
        if @@level == 1
            return PlayerCompLv1.new(name, token, @@board)
        elsif @@level == 2
            return PlayerCompLv3.new(name, token, @@board)
        else
            return PlayerCompLv1.new(name, token, @@board)
        end
    end

end