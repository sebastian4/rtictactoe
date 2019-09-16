rtictactoe
==========

This is my attempt to solve the Tic-Tac-Toe exercise. The rakefile calls either the ttt_main.rb file for the application, or the tc_ttt_main.rb file for testing. Both ttt_main.rb and tc_ttt_main.rb files call the ttt_game_factory.rb file in charge of creating the game based on certain parameters.

## notes

- I borrowed a lot of the core code from this link: https://www.vikingcodeschool.com/professional-development-with-ruby/tic-tac-toe
- for testing, there is an auto player that feeds input from an array to the game
- the easy computer player just spits random coordinates until one is for an empty cell
- for the hard computer player, I am using a minimax algorith

## requirements

- have ruby installed, I tested on a mac and a ubuntu vm machine
- i used rvm and ruby 2.6
- no third party gem libraries are needed

## instructions

- to test, type: 
```
rake test
```

- to run the app, type: 
```
rake 
```
