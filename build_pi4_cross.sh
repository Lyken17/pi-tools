#/bin/bash

export TVM_VERSION=5140d90;
# docker build . \
docker buildx build --platform linux/arm64 \
    -t lyken/pi-tools:pi4-v0.8.0-${TVM_VERSION} \
    . \
    -f pi4.dockerfile \
    --build-arg TVM_VERSION=${TVM_VERSION}

# docker push lyken/pi-tools:pi4-v0.8.0-${TVM_VERSION}
