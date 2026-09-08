module Exercises where
import qualified Assignment1 as Encoding
import qualified Assignment2 as Stocks
import qualified Main as Maze
import Control.Monad (unless)

check :: String -> Bool -> IO ()
check name condition = unless condition (error name)

main :: IO ()
main = do
 check "decode pairs" (Encoding.decode "a3b2" == "aaabb")
 check "encode distinct runs" (Encoding.encode "aaabb" == "a3b2")
 check "empty decode" (Encoding.decode "" == "")
 check "trade cash flow" (Stocks.profit [('B',2,10,"ABC",1),('S',2,12,"ABC",2)] "ABC" == 4)
 check "stock filter" (Stocks.get_trades "XYZ" [('B',2,10,"ABC",1)] == [])
 let maze = ["#####", "#   #", "#####"]
 check "move right" (Maze.move (1,1) 'd' == (2,1))
 check "wall blocks movement" (not (Maze.can_move maze (1,1) 'w'))
 check "boundary blocks movement" (not (Maze.can_move [" "] (0,0) 'a'))
 check "player placement" (Maze.place_player maze (1,1) == ["#####", "#@  #", "#####"])
 putStrLn "9 Haskell checks passed"
