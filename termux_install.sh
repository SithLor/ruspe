# Download Rust nightly toolchain
curl -O https://static.rust-lang.org/dist/rust-nightly-aarch64-unknown-linux-gnu.tar.gz
curl -O https://static.rust-lang.org/dist/rust-std-nightly-aarch64-unknown-linux-gnu.tar.gz
curl -O https://static.rust-lang.org/dist/cargo-nightly-aarch64-unknown-linux-gnu.tar.gz

# Extract the downloaded files
tar -xzf rust-nightly-aarch64-unknown-linux-gnu.tar.gz
tar -xzf rust-std-nightly-aarch64-unknown-linux-gnu.tar.gz
tar -xzf cargo-nightly-aarch64-unknown-linux-gnu.tar.gz

# Install Rust components
cd rust-nightly-aarch64-unknown-linux-gnu
./install.sh --prefix=$PREFIX
cd ../rust-std-nightly-aarch64-unknown-linux-gnu
./install.sh --prefix=$PREFIX
cd ../cargo-nightly-aarch64-unknown-linux-gnu
./install.sh --prefix=$PREFIX

# Verify the installation
rustc --version
cargo --version


# Run the project in release mode for the specified target
cargo run --target aarch64-unknown-linux-gnu -r