#!/usr/bin/env bash 
for file in *.gz 
do 
    file2=${file%.gz}
    gunzip -c ${file} | zstd --ultra -22 -o ${file2}.zstd
done
