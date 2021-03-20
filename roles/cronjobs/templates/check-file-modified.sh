#!/bin/bash


# Check if specified path contains any files modified in the last specified
# number of days (which can be a decimal number).


if [ -z "$PATH" ];
then
    echo 'Specify PATH'
    exit 1
fi

if [ -z "$DAYS" ];
then
    echo 'Specify DAYS'
    exit 1
fi

find $PATH -mtime -$DAYS

