require "./ttt_game_factory"
require "./ttt_mock_data"
require "test/unit"

class TestTTTGameFactory < Test::Unit::TestCase

    include TTTGameFactory
    include TTTMockData

    def test_build_12
        mock_data = buildMockData12
        t = buildTicTacToeGame(true, 2, mock_data)
        t.play
        assert_operator t.loops, :>, 3
        assert_equal t.player_x.name, "player x"
        assert_equal t.player_o.name, "computer"
    end

    def test_build_15
        mock_data = buildMockData15
        t = buildTicTacToeGame(true, 1, mock_data)
        t.play
        assert_operator t.loops, :>, 3
        assert_equal t.player_x.name, "computer"
        assert_equal t.player_o.name, "player o"
    end

    ####

    def buildMockData12
        assign = "X"
        data = [ "A2", "B3", "1C", "C2", "C3", "B2", "B1", "A1", "A3" ]
        mock_data = MockData.new(assign, data)
        return mock_data
    end

    def buildMockData15
        assign = "O"
        data = [ "A2", "C1", "B2", "C2", "B3", "C3", "B1", "A1", "A3" ]
        mock_data = MockData.new(assign, data)
        return mock_data
    end
 
end