#!/usr/bin/env bash

# set -e makes the script exit if any command fails
# set -u makes the script exit if any unset variable is used
# set -o pipefail makes the script exit if any command in a pipeline fails
set -euo pipefail

for i in 2 4 8 16 32 64
do
    echo "---"
    echo "> timeline, $i threads"
    erl +S $i -noshell -s benchmark test_timeline_para -s init stop > "benchmarks/result-timeline-$i.txt"
    echo "---"
done
