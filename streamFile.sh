#!/bin/bash

if [ -z "$1" ]
then
    echo "No input specified, example of execution:"
    echo "./$0 inputFile.mp4"
    
fi

ffmpeg  -i $1 -c:v copy -c:a copy -f hls -hls_time 10 -hls_list_size 50 -hls_flags delete_segments stream/stream.m3u8
