#!/usr/bin/env bash

# set -e makes the script exit if any command fails
# set -u makes the script exit if any unset variable is used
# set -o pipefail makes the script exit if any command in a pipeline fails
set -euo pipefail

for i in {1..8}
do
    echo "---"
    echo "> timeline, $i threads"
    erl +S $i -noshell -s benchmark test_timeline_para -s init stop > "benchmarks/result-timeline-$i.txt"
    echo "---"
    echo "---"
    echo "> message, $i threads"
    erl +S $i -noshell -s benchmark test_send_message_para -s init stop > "benchmarks/result-message-$i.txt"
    echo "---"
done
