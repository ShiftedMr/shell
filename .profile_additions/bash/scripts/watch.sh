#!/bin/bash
delay=5
if [[ -z "${WATCH_DELAY}" ]]; then
  delay=5
else
  delay=${WATCH_DELAY}
fi
while :; do clear; $@ ; sleep $delay; done
echo "$@"
