#!/usr/bin/env bash
dir=$1

if [[ -z $dir ]]; then
    dir="$(pwd)"
fi

if [[ "$#" -eq 2 ]] && [[ "$2" -eq 1  ]]; then
    only_print_modified=1
fi

if [ ! -d "${dir}/.git" ]; then
    exit 1
fi

tracked_count=$(bash /Users/frsmith/bin/git_tracked_count.sh ${dir})
if [[ only_print_modified ]]; then
    if [[ "$tracked_count" -gt 0 ]]; then
        git -C ${dir} branch 2>/dev/null | awk -v path="${dir}" -v count="${tracked_count}" '/\*/{print path ": " $2 " changes_pendings: " count}' | sed 's/\\n//g' 
    fi
else

    git -C ${dir} branch 2>/dev/null | awk -v path="${dir}" -v count="${tracked_count}" '/\*/{print path ": " $2 " changes_pendings: " count}' | sed 's/\\n//g' 
fi
