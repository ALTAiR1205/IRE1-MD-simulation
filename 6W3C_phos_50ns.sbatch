#!/bin/bash
#SBATCH --job-name 6W3C_phos_50ns 
#SBATCH --time=3:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gpus-per-node=4
#SBATCH --account=PAS2506
#SBATCH --mail-type=BEGIN,END,FAIL

module reset
module load desmond/2023.4
module list

$SCHRODINGER/utilities/multisim \
  -HOST localhost \
  -maxjob 1 \
  -cpu 1 \
  -m desmond_md_job_19.msj \
  -c desmond_md_job_19.cfg \
  desmond_md_job_19-out.cms \
  -mode umbrella \
  -ATTACHED -WAIT