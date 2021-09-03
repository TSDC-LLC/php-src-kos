#!/bin/bash

set -e

BUILD=$PWD/.build
mkdir -p $BUILD && cd $BUILD

export LANG=C
export TARGET="x86_64-pc-kos"
export PKG_CONFIG=""
export SDK_PREFIX="/opt/KOS-CE-SDK-RPI4-x86-64-QEMU-0.0.0.40"
BUILD_SIM_TARGET="y"
export PATH="$SDK_PREFIX/toolchain/bin:$PATH"

cmake -G "Unix Makefiles" ${CMAKE_OPTS} \
      -D CMAKE_BUILD_TYPE:STRING=Debug \
      -D CMAKE_INSTALL_PREFIX:STRING=$BUILD/../install \
      -D CMAKE_TOOLCHAIN_FILE=$SDK_PREFIX/toolchain/share/toolchain-x86_64-pc-kos.cmake \
      ../ && make -j$(nproc) sim
