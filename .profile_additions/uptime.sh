#! /usr/bin/env bash
h=$(uptime |cut -f 4 -d' '|cut -f 1 -d','|cut -f1 -d":");
m=$(uptime |cut -f 4 -d' '|cut -f 1 -d','|cut -f2 -d':'); 
total=$(echo "${h}*60+${m}"|bc -l)
echo "Up ${total} mins"
