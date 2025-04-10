#!/bin/bash

set -euo pipefail
# run from file's dir
cd "$(dirname "${BASH_SOURCE[0]}")"

DATA_DIR="../data/raw"
FASTQ_DIR="${DATA_DIR}/fastq/SRP255885"
mkdir -pv "$FASTQ_DIR"

# setup fastqs
R1="https://raw.githubusercontent.com/AlexsLemonade/reproducible-research/main/instructor_notes/fastq_subset/subset-SRR11518889_1.fastq.gz"
R1_base="subset-SRR11518889_1.fastq.gz"

R2="https://raw.githubusercontent.com/AlexsLemonade/reproducible-research/main/instructor_notes/fastq_subset/subset-SRR11518889_2.fastq.gz"
R2_base="subset-SRR11518889_2.fastq.gz"

# download fastqs to fastq dir
curl -o "${FASTQ_DIR}/${R1_base}" "$R1"
curl -o "${FASTQ_DIR}/${R2_base}" "$R2"

# count lines
echo "The number of lines in $R1_base is:"
gunzip -c  "${FASTQ_DIR}/${R1_base}" | wc -l
echo "The number of lines in $R2_base is:"
gunzip -c  "${FASTQ_DIR}/${R2_base}" | wc -l


