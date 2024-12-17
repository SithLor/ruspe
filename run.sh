mkdir benchmark

cargo build --release

# Run the benchmarks
UNIX_TIMESTAMP=$(date +%s)
cargo run -r > benchmark/benchmark-$UNIX_TIMESTAMP.txt