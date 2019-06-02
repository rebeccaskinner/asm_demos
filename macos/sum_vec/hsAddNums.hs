{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE BangPatterns #-}
module Main where

import System.Environment (getArgs)
import qualified Foreign.C.Types as C
import qualified Foreign.Ptr as Foreign
import qualified Foreign.Marshal as Foreign
import qualified Foreign.Marshal.Array as Foreign
import qualified Control.Exception as Exception

foreign import ccall "sumvec" c_sumvec :: (Foreign.Ptr C.CULLong) -> C.CULLong -> C.CULLong

marshalNumList :: [Integer] -> IO (Foreign.Ptr C.CULLong)
marshalNumList = Foreign.newArray . (map fromIntegral)

sumVec :: [Integer] -> IO Integer
sumVec !nums = do
  cNums <- marshalNumList nums
  let !cNumLen = fromIntegral (length nums)
      !cSum = fromIntegral $ c_sumvec cNums cNumLen
  Foreign.free cNums
  return cSum

main = (map read <$> getArgs) >>= sumVec >>= print
