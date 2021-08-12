# /bin/bash

BASE=lyken/pi-tools:pi4-v0.8.0-5140d90
docker pull $BASE
docker run -it --rm \
    $BASE \
    /bin/bash