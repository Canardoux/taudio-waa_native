#!/bin/bash

bin/build-debug.sh
bin/build-release.sh

cd rust
cbindgen ./src/lib.rs -c cbindgen.toml | grep -v \#include | uniq > target/bindings.h
cd ..

