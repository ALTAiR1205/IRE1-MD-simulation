#!/bin/bash
#SBATCH --job-name=6W3C_dephos_RMSD_50ns
#SBATCH --account=PAS2506
#SBATCH --partition=batch          # CPU partition
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --output=clusterA_%j.out
#SBATCH --mail-type=BEGIN,END,FAIL

module reset
module load desmond/2023.4

CMS="lijikun20250929T035330-out.cms"
TRJ="lijikun20250929T035330_trj"
ST2="RMSD.st2"
OUT="6W3C_dephos_RMSD_50ns.csv"

# Optional: sample every 10th frame (speed). Remove -s ::10 to use all frames.
srun $SCHRODINGER/run analyze_simulation.py \
  "$CMS" "$TRJ" "$OUT" "$ST2" \
