#!/bin/bash

# TODO: Satisfy dependencies
# Note them here if you find them

set -e
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Download source
wget -nc "https://github.com/wxWidgets/wxWidgets/releases/download/v3.1.0/wxWidgets-3.1.0.tar.bz2"

echo "Extracting source..."
mkdir -p src
bsdtar -xf wxWidgets-3.1.0.tar.bz2 -C src/

echo "Building shared libraries for Linux (wxGTK)"
cd $DIR
mkdir -p $DIR/src/gtk-shared-build
mkdir -p $DIR/install/gtk-shared-build
cd $DIR/src/gtk-shared-build
$DIR/src/wxWidgets-3.1.0/configure --prefix=$(pwd) --enable-unicode
make -j4

echo "Building static libraries for Windows (WxMSW)"
cd $DIR
mkdir -p $DIR/src/msw-static-build
mkdir -p $DIR/install/msw-static-build
cd $DIR/src/msw-static-build
$DIR/src/wxWidgets-3.1.0/configure --prefix=$(pwd) --host=i686-w64-mingw32 --enable-unicode --with-msw --without-subdirs --disable-shared
make -j4
