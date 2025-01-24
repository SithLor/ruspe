//
use std::fs::OpenOptions;
use std::io::{Seek, SeekFrom, Write};

fn write_process_memory(pid: u32, address: usize, data: &[u8]) -> Result<(), std::io::Error> {
    // 
    let mem_path = format!("/proc/{}/mem", pid);
    let mut mem_file = OpenOptions::new().write(true).open(mem_path)?;
    mem_file.seek(SeekFrom::Start(address as u64))?;
    mem_file.write_all(data)?;
    Ok(())
}