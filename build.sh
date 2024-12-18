# Copy release files to the build directory

mkdir -p build

# Build for Linux x86_64
cargo build --release --target=x86_64-unknown-linux-gnu

# Build for ARM aarch64
cargo build --release --target=aarch64-unknown-linux-gnu

# Build for ARM (Android)
cargo build --release --target=arm-linux-androideabi

# Copy ARM aarch64 release files
cp -r target/aarch64-unknown-linux-gnu/release/rusp build/rusp_arm_cortex_x1

# Copy Linux x86 release files
cp -r target/x86_64-unknown-linux-gnu/release/rusp build/

# Copy ARM (Android) release files
cp -r target/arm-linux-androideabi/release/rusp build/rusp_arm_android