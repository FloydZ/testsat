#!/usr/bin/env bash
builder=("build_kissat" "build_parafrost_cpu")
runner=("run_kissat") # "run_parafrost_cpu")

threads=4
out_folder="results/CI"
results_file="${out_folder}/results"
touch ${results_file}

task() {
    out_file=${1}
    echo "Running: ${out_file}"
    # run the solver 
    s=`date +%s.%N`
    ./solvers/${r}.sh ${file2} > ${out_file}
    e=`date +%s.%N`
    runtime=$( echo "${e} - ${s}" | bc -l )
    
    # check if the instance was solved or not
    unsat=$(grep -F "s UNSATISFIABLE" ${out_file})
    sat=$(grep -F "s SATISFIABLE" ${out_file})
    unsat="${unsat/s /}"
    sat="${sat/s /}"
    
    # write  the result back
    echo ${filename}.${r} ${unsat} ${sat} ${runtime} >> ${results_file}
}

# to make sure that the CI doesnt run for ever
counter=0
for file in instances/*.xz
do
    while [ `jobs | wc -l` -ge ${threads} ]
    do
      sleep 5
    done

    # -k: keep, -d: decompress
    xz -kd ${file}
    # remove the file ending
    file2=${file%.xz}
    # remove the path to only get the filename
    filename=${file2##*/}
    # go through each runner
    for r in "${runner[@]}"
    do 
        out_file="${out_folder}/${filename}.${r}"
        if [ ! -f ${out_file} ]; then
            task ${out_file} &
        fi
    done

    sleep 4
    rm instances/*.cnf
    counter=$((counter+1))
    if [[ "$counter" -gt 44 ]]; then
       echo "Counter: $counter times reached; Exiting loop!"
       exit 0
    fi
done 
