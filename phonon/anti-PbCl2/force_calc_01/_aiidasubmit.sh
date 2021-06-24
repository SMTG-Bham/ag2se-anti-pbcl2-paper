#!/bin/bash -l
#$ -cwd
#$ -S /bin/bash
#$ -m n
#$ -N aiida-385862
#$ -V
#$ -o _scheduler-stdout.txt
#$ -e _scheduler-stderr.txt
#$ -pe mpi 20
#$ -l h_rt=24:00:00

module unload default-modules/2018
module load rcps-core/1.0.0

module unload compilers mpi
module load compilers/intel/2017/update1
module load mpi/intel/2017/update1/intel

'mpirun' '-np' '20' '/shared/ucl/apps/vasp/5.4.4-18apr2017/intel-2017/bin/vasp_std'   
