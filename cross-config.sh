#!/bin/bash

export LANG=C
export TARGET="x86_64-pc-kos"
export SDK_PREFIX="/opt/KOS-CE-SDK-RPI4-x86-64-QEMU-0.0.0.40"
BUILD_SIM_TARGET="y"
export PATH="$SDK_PREFIX/toolchain/bin:$PATH"

export CROSS_PATH=${SDK_PREFIX}/toolchain/bin/${TARGET}

export CPP=${CROSS_PATH}-cpp
export AR=${CROSS_PATH}-ar
export AS=${CROSS_PATH}-as
export NM=${CROSS_PATH}-nm
export CC=${CROSS_PATH}-gcc
export CXX=${CROSS_PATH}-g++
export LD=${CROSS_PATH}-ld
export RANLIB=${CROSS_PATH}-ranlib

export LDFLAGS="-L${SDK_PREFIX}/sysroot-x86_64-pc-kos/lib/"

PHP_AUTOCONF=$SDK_PREFIX/toolchain/bin/autoconf PHP_AUTOHEADER=$SDK_PREFIX/toolchain/bin/autoheader ./buildconf --force
./configure \
LIBXML_CFLAGS=-I$SDK_PREFIX/sysroot-x86_64-pc-kos/include/libxml2 LIBXML_LIBS="-L$SDK_PREFIX/sysroot-x86_64-pc-kos/lib/ -lxml2" \
OPENSSL_CFLAGS=-I$SDK_PREFIX/sysroot-x86_64-pc-kos/include/openssl OPENSSL_LIBS="-L$SDK_PREFIX/sysroot-x86_64-pc-kos/lib/ -lssl -lcrypto" \
SQLITE_CFLAGS=-I$SDK_PREFIX/sysroot-x86_64-pc-kos/include SQLITE_LIBS="-L$SDK_PREFIX/sysroot-x86_64-pc-kos/lib/ -lsqlite3" \
--with-openssl --target=x86_64 --host=x86_64 --bindir=$SDK_PREFIX/toolchain/bin --includedir=$SDK_PREFIX/sysroot-x86_64-pc-kos/include \
--disable-opcache --without-valgrind

# @todo: figure out how to enable OPcache
