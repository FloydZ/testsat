#!/usr/bin/env bash
##nix-shell -p cudatoolkit cudaPackages.cuda_cudart 
# TODO make generic
export CUDA_PATH=/nix/store/63i9isjm6wxwl9287ph0jrbbzzjz4rlk-cuda-merged-12.4
cd ParaFROST
./install.sh --gpu
