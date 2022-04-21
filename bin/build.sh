#!/bin/bash

bin/build-debug.sh
bin/build-release.sh

cd rust
cbindgen ./src/lib.rs -c cbindgen.toml | grep -v \#include | uniq > target/bindings.h
cd ..


cd ios
rm Podfile.lock
pod install
xcodebuild -scheme taudio-waa_native clean
xcodebuild -scheme taudio-waa_native build
cd ..
