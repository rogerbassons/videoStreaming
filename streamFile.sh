#!/bin/bash

#ffmpeg -i $1 -c:v libx264 -c:a aac -strict -2 -f hls -hls_list_size 0 stream.m3u8
#ffmpeg -i $1 -map 0 -codec:v libx264 -codec:a aac -f ssegment -segment_list stream.m3u8 -segment_list_flags +live -segment_time 10 out%03d.ts

ffmpeg  -i $1 -c:v libx264 -c:a aac -pix_fmt yuv420p -f hls -hls_time 10 -hls_list_size 50 -hls_flags delete_segments stream.m3u8
