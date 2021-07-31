FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y python3 python3-dev python3-setuptools gcc libtinfo-dev zlib1g-dev build-essential cmake libedit-dev libxml2-dev

RUN apt-get install -y llvm-9 git vim

RUN git clone --recursive https://github.com/apache/tvm tvm
WORKDIR /tvm

RUN mkdir build && \
    cp cmake/config.cmake build

# -j2 to avoid OOM 
RUN cd build && \ 
    sed -i "s/USE_LLVM\ OFF/USE_LLVM\ ON/" config.cmake && \
    cmake .. && \
    make -j2 
