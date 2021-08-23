# SH_Files

This is a collection of various Bash scripts

Test.

`gpu_select2.sh` is a script written to select a single nvidia GPU from a node with multiple GPUs. The selection process is not particularly robust, but I have found it workable. It chooses the GPU with the least usage rate based on the output from `nvidia-smi`.  

