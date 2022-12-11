#!/usr/bin/env bash
set -euo pipefail

LENGTH=$#

if [ ${LENGTH} = 0 ]; then
    echo "usage: deep-which program ..."
    exit 1
fi

for program in "$@"; do
    result="$(command -v ${program})"
    if [ -e "${result}" ]; then
        ls -lFG "${result}"
    else
        echo "${result}"
    fi
done
