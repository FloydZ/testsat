#!/usr/bin/env bash
builder=("build_kissat" "build_parafrost_cpu")
runner=("run_kissat" "run_parafrost_cpu")

cd solver
for b in "${builder[@]}"
do 
    ./${b}
done
