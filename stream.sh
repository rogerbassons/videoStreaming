#!/bin/bash

if [ -z "$1" ]
then
    echo "Error: No input specified."
    echo "To stream a file:        $0 inputFile.mp4"
    echo "To stream from webcam:   $0 webcam"
    exit 1
fi

DIR="stream"
if [ ! -d "$DIR" ]; then
    mkdir stream
fi

[ "$1" == "webcam" ] && ffmpeg -f v4l2 -framerate 25 -video_size 640x480 -i /dev/video0 -codec:v libx264 -codec:a aac -pix_fmt yuv420p -f hls -hls_time 10 -hls_list_size 3 -hls_wrap 4 -hls_flags delete_segments $DIR/stream.m3u8 && exit 0

ffmpeg  -re -i $1 -c:v copy -c:a copy -f hls -hls_time 10 -hls_list_size 50 -hls_flags delete_segments $DIR/stream.m3u8

