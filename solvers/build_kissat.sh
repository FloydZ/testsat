#!/usr/bin/env bash

cd kissat
./configure
sed -i -e 's/-O3/-O3 -march=native -funroll-loops/g' ./build/makefile
make -j4
