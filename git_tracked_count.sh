#!/usr/bin/env bash
dir=$1

if [[ -z $dir ]]; then
    dir="."
fi

git -C ${dir} status -uno 2>/dev/null | grep -e'^\t' |wc -l | sed 's/ *//' | sed 's/\\n//g'
