#!/bin/bash
# Exit on error
set -e

# Install dependencies
apt-get update &&
    apt-get install -y \
        python3 \
        python3-pip \
        cmake &&
    rm -rf /var/lib/apt/lists/*

# Set Python alias
ln -s /usr/bin/python3 /usr/bin/python

export EMSCRIPTEN=/emsdk/upstream/emscripten

# Clone opencv
git clone https://github.com/opencv/opencv.git

# Patch the build script to allow unknown arguments
OLD_LINE="args = parser.parse_args()"
NEW_LINE="args, _ = parser.parse_known_args()"
sed -i "s/$OLD_LINE/$NEW_LINE/g" ./opencv/platforms/js/build_js.py
cp ./opencv_js.config.py ./opencv/platforms/js/

# Build!
cd opencv &&
    emcmake python ./platforms/js/build_js.py \
        ./build_wasm \
        --build_wasm \
        --build_test

# Bundle everything up into ./dist dir and clean up
mkdir ../dist
# Grab the built JS file
cp ./build_wasm/bin/opencv_js.js ../index.js
# Delete the opencv source
cd .. && rm -rf ./opencv
# Copy into dist
cp ./* ./dist
