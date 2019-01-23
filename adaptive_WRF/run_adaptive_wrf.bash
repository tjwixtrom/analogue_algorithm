#!/bin/sh
#$ -V
#$ -cwd
#$ -S /bin/bash
#$ -N run_adaptive
#$ -P quanah
#$ -q omni
#$ -pe sm 36
#$ -l h_rt=10:00:00
#$ -t 1-2:1

#############################################################
#
#  Driver script for running adaptive WRF forecasts in
#  array jobs.
#
#############################################################

module load intel
module load impi
module load netcdf-serial

python_exec=/home/twixtrom/miniconda3/envs/analogue/bin/python
param=/home/twixtrom/adaptive_WRF/adaptive_WRF/adaptive_parameters.bash
ndays=$(( $SGE_TASK_ID - 1 ))

${python_exec} ${ndays}