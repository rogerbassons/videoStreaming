#!/bin/bash

if [ -z "$1" ]
then
    echo "No port specified, example of server on port 8080:"
    echo "$0 8080"
    exit 1
fi


python -m SimpleHTTPServer $1
