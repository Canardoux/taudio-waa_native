#!/bin/bash

cd rust
cargo lipo # debug!
export ANDROID_NDK=$ANDROID_HOME/ndk/android-ndk-r21e
export NDK=$ANDROID_NDK
export ANDROID_NDK_ROOT=$ANDROID_NDK
export ANDROID_NDK_HOME=$ANDROID_NDK
make android-debug
cd ..