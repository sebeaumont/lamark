{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE FlexibleContexts #-}
module Main where

import Data.Array.Accelerate as A
import Data.Array.Accelerate.LLVM.Native as CPU
import qualified Prelude as P

type Matrix = Array DIM2

msize :: Int
msize = 4096

vsize :: Int
vsize = 100000

type Etype = Float


dotp :: Num a => Acc (Vector a) -> Acc (Vector a) -> Acc (Scalar a)
dotp xs ys = fold (+) 0 ( zipWith (*) xs ys )

mvm :: A.Num a => Acc (Matrix a) -> Acc (Vector a) -> Acc (Vector a)
mvm mat vec =
  let Z :. rows :. cols = unlift (shape mat) :: Z :. Exp Int :. Exp Int
      vec' = A.replicate (lift (Z :. rows :. All)) vec
  in
    A.fold (+) 0 (A.zipWith (*) mat vec')

main :: P.IO ()
main =
  let v1 = fromList (Z :. vsize) [1..] :: Vector Etype
      m0 = fromList (Z :. vsize :. msize) [1..] :: Matrix Etype
      vr = CPU.run $ mvm (use m0) (use v1)
  in
    P.print vr

