#!/usr/bin/env bash 

for file in *.cnf
do 
    zpaq a ${file}.zpaq ${file} -m5 -t0
    #rm *.cnf
done
