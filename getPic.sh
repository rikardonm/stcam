#!/bin/bash
fswebcam -d /dev/video0  --jpeg 90 -i 0 -r 1920x1080 -S 4 -F 10 $1
#fswebcam -q -d /dev/video0 --no-banner --jpeg 99 -i 0 -r 1920x1080 -S 4 $1
#rm v0.jpeg
