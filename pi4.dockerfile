FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y python3 python3-dev python3-setuptools gcc libtinfo-dev zlib1g-dev build-essential cmake libedit-dev libxml2-dev

ARG LLVM_VERSION=9
RUN apt-get install -y llvm-${LLVM_VERSION} git  

# Some Dev Tools
RUN apt-get update -y && \
    apt-get install -y vim python3-pip

ARG TVM_VERSION=v0.8.0
ARG GIT_URL=https://github.com/apache/tvm
RUN echo ${GIT_URL}
RUN git clone --recursive ${GIT_URL} tvm
WORKDIR /tvm
RUN git checkout -b ${TVM_VERSION}

RUN mkdir build && \
    cp cmake/config.cmake build

SHELL ["/bin/bash", "-c"]

# -j4 to avoid OOM
RUN cd build && \ 
    sed -i "s/USE_LLVM\ OFF/USE_LLVM\ ON/" config.cmake && \
    cmake .. && \
    make -j$(nproc)

RUN pip3 install numpy decorator attrs tornado cloudpickle

# Add to Python PATH
# RUN echo "export TVM_HOME=/tvm" >> ~/.bashrc && \
#     echo "export PYTHONPATH=\$TVM_HOME/python:\$PYTHONPATH" >> ~/.bashrc && \
#     source ~/.bashrc
RUN cd python &&  python3 setup.py install


