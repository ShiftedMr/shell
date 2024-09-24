#!/bin/bash
# License: Use it; save time; not tested well but will update as I get energy.
# partially created using code generators

MAX_ARGS=0

# Function to display help
function display_help {
    echo "Usage: $0 [options] [arguments]"
    echo
    echo "Options:"
    for option in "${OPTIONS[@]}"; do
        KEY="${option%%:*}"
        DESC="${option##*:}"
        echo "  ${KEY}:    ${DESC}"
    done
    echo "Args:"

    exit 0
}

# Define all options here: "short_key|long_key:description"
OPTIONS=(
    "-h|--help: Show this help message"
    "-f|--flag: Example flag"
    "-n|--number: Example option with argument"
)

# Initialize variables for flags and options
FLAG=false # this represents any flag we want for a boolean; You'll need one per option type
           # to make this easiest you'll probably want this to be a map with flag_key -> bool
           # or an array that default assumes missing and inserts when set
           # I'm too lazy to write that right now
NUMBER=""  # this represents any option that needs a value; like above we'll need
           # one per option that requires a value. Probably best with some type of map

# Parse options using a while loop and shift
while [[ "$#" -gt 0 ]]; do
    FOUND=false
    for option in "${OPTIONS[@]}"; do
        KEY="${option%%:*}"
        SHORT_KEY="${KEY%%|*}"
        LONG_KEY="${KEY##*|}"

        case "$1" in
            $SHORT_KEY|$LONG_KEY)
                FOUND=true
                case "$1" in
                    -h|--help)
                        display_help
                        ;;
                    -f|--flag)
                        FLAG=true
                        ;;
                    -n|--number)
                        if [[ -n "$2" && "$2" != -* ]]; then
                            NUMBER="$2"
                            shift
                        else
                            echo "Error: --number requires a value"
                            exit 1
                        fi
                        ;;
                esac
                break
            ;;
        esac
    done

    if ! $FOUND; then
        if [[ "$1" == -- ]]; then
            shift
            break
        elif [[ "$1" == -* ]]; then
            echo "Unknown option $1"
            exit 1
        else
            break
        fi
    fi

    shift
done

# Remaining arguments after flags
ARGS=("$@")

if [[ ${#args_copy[@]} -gt ${MAX_ARGS} ]]; then
  echo "Too many args; max is ${MAX_ARGS}"
  exit 1
fi

# Example output of parsed options and arguments
echo "FLAG: $FLAG"
echo "NUMBER: $NUMBER"
echo "Arguments: ${ARGS[@]}"

# Further script logic goes here...
