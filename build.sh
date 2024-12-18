# Copy release files to the build directory

mkdir -p build

# Copy ARM release files
cp -r target/aarch64-unknown-linux-gnu/release/rusp build/rusp_arm_cortex_x1

# Copy Windows release files
cp -r target/x86_64-pc-windows-msvc/release/rusp.exe build/

# Copy Linux x86 release files
cp -r target/x86_64-unknown-linux-gnu/release/rusp build/