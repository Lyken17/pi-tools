#/bin/bash

export TVM_VERSION=5140d90;
docker build . -f pi4.dockerfile -t \
    lyken/pi-tools:pi4-v0.8.0-${TVM_VERSION} \
    --build-arg TVM_VERSION=${TVM_VERSION}

docker push lyken/pi-tools:pi4-v0.8.0-${TVM_VERSION}
