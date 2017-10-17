#!/bin/bash

#ffmpeg -f v4l2 -framerate 25 -video_size 640x480 -i /dev/video0 -codec:v libx264 -codec:a aac -pix_fmt yuv420p -map 0 -f ssegment -segment_list stream.m3u8 -segment_list_flags +live -segment_time 5 out%03d.ts

ffmpeg -f v4l2 -framerate 25 -video_size 640x480 -i /dev/video0 -codec:v libx264 -codec:a aac -pix_fmt yuv420p -f hls -hls_time 10 -hls_list_size 3 -hls_wrap 4 -hls_flags delete_segments stream.m3u8
