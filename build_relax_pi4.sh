#/bin/bash

export TVM_VERSION=5140d90;
export TARGET=lyken/pi-tools:relax-pi4-${TVM_VERSION}

docker build . -f pi4.dockerfile -t \
    $TARGET \
    --build-arg TVM_VERSION=${TVM_VERSION} \
    --build-arg GIT_URL="https://github.com/tlc-pack/relax"

docker push $TARGET
