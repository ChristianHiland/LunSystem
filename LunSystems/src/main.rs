// src/main.rs

fn main() {
    println!("Welcome to LunSystems!");

    // This block is only compiled if `CONFIG_ENABLE_FEATURE_X=y` was set
    #[cfg(howling_install_compile)] { println!("HOWLING_INSTALL_COMPILE is enabled!"); }
    

    // Get the User Name string using the env! macro
    println!("User: {}", user_name);

    // Get the retry count, parse it from a string to an integer
    let retry_count: i32 = retry_count_str.parse().expect("CONFIG_RETRY_COUNT is not a valid integer");
    println!("Retry count: {}", retry_count);
}