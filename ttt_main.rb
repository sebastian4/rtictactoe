require "./ttt_game_factory"

include TTTGameFactory

t = buildTicTacToeGame(false, 1, nil)
t.play
