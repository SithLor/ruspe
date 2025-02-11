fn _fast_pure_rust(t: usize) {
    let price_per_item_max = 300_000_000i64;
    let price_per_item_min = 0i64;
    let item_in_game = 400usize;

    let arr: Vec<Item> = (0..item_in_game)
        .into_par_iter()
        .map_init(
            || Pcg64Mcg::from_entropy(),
            |rng: &mut rand_pcg::Mcg128Xsl64, _| {
                let name: String = rng.gen_range(0..150).to_string();

                let price_dist: Uniform<i64> = Uniform::new(price_per_item_min, price_per_item_max);
                let sell_dist: Uniform<i64> = Uniform::new(price_per_item_min, price_per_item_max);

                let price: Vec<i64> = rng.sample_iter(&price_dist).take(t).collect();
                let sell: Vec<i64> = rng.sample_iter(&sell_dist).take(t).collect();

                Item { name, price, sell }
            },
        )
        .collect();

    let size_byte = calculate_size(&arr);
    //set static
    unsafe {
        SIZE_BYTE = size_byte;
    }
}

fn _pure_rust(t: usize) {
    let price_per_item_max = 300_000_000;
    let price_per_item_min = 0;
    let item_in_game = 400;

    let arr: Vec<Item> = (0..item_in_game)
        .into_par_iter()
        .map(|_| {
            let mut r: rand::prelude::ThreadRng = rand::thread_rng();
            Item {
                name: r.gen_range(0..150).to_string(),
                price: {
                    let mut price_vec = Vec::with_capacity(t);
                    for _ in 0..t {
                        price_vec.push(r.gen_range(price_per_item_min..price_per_item_max));
                    }
                    price_vec
                },
                sell: {
                    let mut sell_vec = Vec::with_capacity(t);
                    for _ in 0..t {
                        sell_vec.push(r.gen_range(price_per_item_min..price_per_item_max));
                    }
                    sell_vec
                },
            }
        })
        .collect();

    let size_byte = calculate_size(&arr);

    unsafe {
        SIZE_BYTE = size_byte;
    }
    // std::thread::sleep(std::time::Duration::from_secs(10));
}

//bench mark stuff

fn test(size: usize) {
    let t = size;

    println!("{}:", t);
    let now: Instant = Instant::now();
    _fast_pure_rust_simd(t);
    println!("  _fast_pure_rust_simd({}):{:?}", t, now.elapsed());

    //perf timer
    let now: Instant = Instant::now();
    _pure_rust(t);
    println!("  _pure_rust({}):{:?}", t, now.elapsed());

    let now = Instant::now();
    _fast_pure_rust(t);
    println!("  _fast_pure_rust({}):{:?}", t, now.elapsed());

    //print memory usage
    unsafe {
        println!("    gb:{:?}", SIZE_BYTE as f64 / 1024.0 / 1024.0 / 1024.0);
        println!("    mb:{:?}", SIZE_BYTE as f64 / 1024.0 / 1024.0);
        println!("    kb:{:?}", SIZE_BYTE as f64 / 1024.0);
    }
    //wait for os to release memory
    std::thread::sleep(std::time::Duration::from_secs(1));
}
fn welcome() {
    // Print time and date
    println!("this what it does genrate (400*x*(0 to 300_000_000 random ))*8 bytes of data");
}