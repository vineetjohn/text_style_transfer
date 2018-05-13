#!/bin/bash
#PBS -l nodes=1:ppn=24
#PBS -l walltime=4:00:00
#PBS -N session1_default
#PBS -A course
#PBS -q ShortQ

PATH=/home/v2john/.miniconda2/bin:$PATH \
MKL_THREADING_LAYER=GNU \
THEANO_FLAGS='floatX=float32' \
CUDA_ROOT=${CUDA_HOME} \
PATH=${CUDA_HOME}bin:$PATH \
python -u ./translate.py -n -p 10 \
    models/model.npz  \
    ../../data/dict.pkl \
    ../../data/dict.pkl \
    ../../data/q_test.txt \
    ./q_test_style0.txt

PATH=/home/v2john/.miniconda2/bin:$PATH \
MKL_THREADING_LAYER=GNU \
THEANO_FLAGS='floatX=float32' \
CUDA_ROOT=${CUDA_HOME} \
PATH=${CUDA_HOME}bin:$PATH \
python -u ./translate1.py -n -p 10 \
    models/model.npz  \
    ../../data/dict.pkl \
    ../../data/dict.pkl \
    ../../data/q_test.txt \
    ./q_test_style1.txt
