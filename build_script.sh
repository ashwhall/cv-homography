#!/bin/bash
# Exit on error
set -e

# Load the version number from version.env
source ./version.env

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

# Clone opencv and checkout the version tag
git clone --depth 1 --branch $CV_VERSION https://github.com/opencv/opencv.git ./opencv
cd ./opencv

# Patch the build script to allow unknown arguments
OLD_LINE="args = parser.parse_args()"
NEW_LINE="args, _ = parser.parse_known_args()"
sed -i "s/$OLD_LINE/$NEW_LINE/g" ./platforms/js/build_js.py
cp ../opencv_js.config.py ./platforms/js/

# Build!
emcmake python ./platforms/js/build_js.py \
    ./build_wasm \
    --build_wasm \
    --build_test

# Grab the built JS file and clean up
cp ./build_wasm/bin/opencv_js.js ../index.js
# Delete the opencv source
cd .. && rm -rf opencv
