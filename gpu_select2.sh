#!/bin/bash


#generates list of gpus
#nvidia-smi --list-gpus

GPU=$(nvidia-smi --list-gpus | wc -l) 


printf "There are $GPU gpus\n"

echo "Checking usage... "


nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader | {
  while IFS= read -r line
  do
    #split each line output at the space and take the first column
    UTIL[i]=$(echo "${line}" | cut -d ' ' -f 1)
    ((i++))
  done

  #find minimum 
  MIN=${UTIL[0]}
  IDX=0
  m=0
  for n in "${UTIL[@]}"; do 
    echo "GPU UTIL $n GPU NUM $m" 
    if [[ "$n" -lt "$MIN" ]]; then
      MIN="$n"
      IDX="$m"
    fi
    ((m++))
  done


  echo "CUDA_VISIBLE_DEVICES=$IDX"

  export CUDA_VISIBLE_DEVICES=$IDX

  echo $CUDA_VISIBLE_DEVICES

  #code to run goes here
  
  echo "code to run goes here"
  #/home/etpalmer/ThreeSpeciesModel/Test1.sh 
}


