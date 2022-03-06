module Main where

import CardReader

main :: IO ()
main = gameEngine

gameEngine = do
  putStrLn "Game loop"
  player1Input <- getLine
  gameEngine