FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y python3 python3-dev python3-setuptools gcc libtinfo-dev zlib1g-dev build-essential cmake libedit-dev libxml2-dev

ARG LLVM_VERSION=9
RUN apt-get install -y llvm-${LLVM_VERSION} git 

ARG TVM_VERSION=v0.7.0
RUN git clone --recursive https://github.com/apache/tvm tvm
WORKDIR /tvm
RUN git checkout -b ${TVM_VERSION}

RUN mkdir build && \
    cp cmake/config.cmake build

# -j4 to avoid OOM
RUN cd build && \ 
    sed -i "s/USE_LLVM\ OFF/USE_LLVM\ ON/" config.cmake && \
    cmake .. && \
    make -j4


