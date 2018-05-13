#!/bin/bash
#PBS -l nodes=1:ppn=20
#PBS -l walltime=168:00:00
#PBS -N session1_default
#PBS -A course
#PBS -q GpuQ


PATH=/home/v2john/.miniconda2/bin:$PATH \
THEANO_FLAGS='device=cuda0,floatX=float32' \
MKL_THREADING_LAYER=GNU \
CUDA_ROOT=${CUDA_HOME} \
PATH=${CUDA_HOME}/bin:$PATH \
python -u ./train_nmt.py
