module Main where

fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

main = mapM_ print (take 90 $ fibs)
