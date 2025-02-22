#!/usr/bin/env bash

cd kissat
./configure
sed -i -e 's/-O3/-O3 -march=native -flto -funroll-loops/g' ./kissat/build/makefile
make -j4
