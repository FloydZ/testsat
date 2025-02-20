#!/usr/bin/env bash
builder=("build_kissat" "build_parafrost_cpu")
runner=("run_kissat" "run_parafrost_cpu")

#cd solver
#for b in "${builder[@]}"
#do 
#    ./${b}
#done
#cd ..


for file in instances/*.xz
do
    xz -kd ${file}
    file2=${file%.xz}
    for r in "${runner[@]}"
    do 
        ./solvers/${r}.sh ${file2} > ${file2}.${r}
    done
    #rm *.cnf
done
