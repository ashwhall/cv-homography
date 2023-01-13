#!/bin/bash

# Build locally with docker
docker run --rm -v $(pwd):/mount -w /mount emscripten/emsdk:3.1.29 /mount/build_script.sh
