#!/usr/bin/env bash
builder=("build_kissat" "build_parafrost_cpu")
runner=("run_kissat" "run_parafrost_cpu")

cd solvers
for b in "${builder[@]}"
do 
    ./${b}.sh
done
