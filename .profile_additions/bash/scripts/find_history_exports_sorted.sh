#!/bin/bash
history |tr -s ' '|  cut -d ' ' -f3- |sort |uniq | grep "^export"
