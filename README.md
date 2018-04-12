# Basic benchmarks for Linear algebra

This to decide on best implementation for my narrow use case based on
large scale matrix-vector multiply. Which is a surrogate for vector
measurement, depending on one's defintion of inner product.

I intend to test map reduce (zipWith/fold) and iterative implementations
using as many cores as feasible with as much arithmetic density as
possible using single precision floating point as the starting point.

I'll be running these tests on my i7 laptop with NVidia GeForce GPU as
my interest is not on absolute but rather relative performance.

For my own purposes I am also more interested in integer and bitwise
ops due to my research into high-performance DSM.


## Intended libraries to test

[ ] accelerate-llvm-native
[ ] accelerate-blas
[ ] hmatrix
[ ] haskell-eigen

## Reference implementations

[ ] eigen c++
[ ] handcrafted c

## Once I have a CUDA toolkt which is compatible with Xcode 9.3

[ ] accelerate-llvm-ptx
[ ] accelerate-blas (cuBLAS)
[ ] handcrafted CUDA kernel
[ ] hancrafted metal/openCL kernel

## Compilers

I'll be using ghc >8.2, Apples Xcode >9.2 clang and whatever llvm and clang++ is
required by accelerate and ghc combination. Watch this space.


