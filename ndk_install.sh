#!/bin/bash

# Define the URL and the destination directory
NDK_URL="https://dl.google.com/android/repository/android-ndk-r27c-linux.zip"
NDK_ZIP="android-ndk-r27c-linux.zip"
NDK_DIR="android-ndk-r27c"

# Download the NDK
echo "Downloading Android NDK..."
curl -O $NDK_URL

# Extract the NDK
echo "Extracting Android NDK..."
unzip $NDK_ZIP

# Clean up the zip file
echo "Cleaning up..."
rm $NDK_ZIP

# Set the NDK_HOME environment variable
export ANDROID_NDK_HOME=$(pwd)/$NDK_DIR
echo "ANDROID_NDK_HOME set to $ANDROID_NDK_HOME"
#
## Add the NDK toolchain to the PATH
export PATH=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH
echo "NDK toolchain added to PATH"
#
echo "Android NDK setup complete."