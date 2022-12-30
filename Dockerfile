FROM ubuntu:20.04

LABEL maintainer="caio.crux@gmail.com"

RUN export DEBIAN_FRONTEND=noninteractive && \
apt-get update && apt-get install -y \
build-essential \
gcc \
g++ \
make \
cmake \
git \
doxygen \
graphviz \
python3 \
python3-pip \
lcov \
gcovr \
ccache \
cppcheck \
llvm \
clang-format \
clang-tidy \ 
libgtk2.0-dev \ 
pkg-config \
libavcodec-dev \
libavformat-dev \
libswscale-dev  \ 
python3-numpy \
libtbb2 \
libtbb-dev \
libjpeg-dev \
libpng-dev \
libtiff-dev \
libdc1394-22-dev \
libcanberra-gtk-module \
libcanberra-gtk3-module && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*

# OpenCV Version 
ARG OPENCV_VERSION=4.x

# Clone, build and install OpenCV
RUN git clone --depth 1 --branch ${OPENCV_VERSION} https://github.com/opencv/opencv.git && \
    git clone --depth 1 --branch ${OPENCV_VERSION} https://github.com/opencv/opencv_contrib.git && \
    cd opencv && \
    mkdir build && \
    cd build && \
    cmake \
    -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/ \
    -D PYTHON3_PACKAGES_PATH=/usr/lib/python3/dist-packages \
    -D WITH_V4L=ON \
    -D WITH_QT=OFF \
    -D WITH_OPENGL=ON \
    -D WITH_GSTREAMER=ON \
    -D OPENCV_GENERATE_PKGCONFIG=ON \
     #-D OPENCV_ENABLE_NONFREE=ON \
     # -D OPENCV_EXTRA_MODULES_PATH=/opt/opencv_contrib/modules \
    -D INSTALL_PYTHON_EXAMPLES=OFF \
    -D INSTALL_C_EXAMPLES=OFF \
    -D BUILD_EXAMPLES=OFF .. && \
   make -j"$(nproc)" && \
   make install

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu

USER ubuntu

COPY . /home/ubuntu

WORKDIR /home/ubuntu

