# /bin/bash

BASE=lyken/pi-tools:pi4-v0.8.0-5140d90
docker pull $BASE
docker run -it --rm \
    $BASE \
    /bin/python3 -m tvm.exec.rpc_server --tracker=g0.mit.edu:9190 --key rasp4b