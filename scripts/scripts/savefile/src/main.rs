use clap::Parser;
use std::{fs, fs::File};
use std::io;
use std::path::{Path, PathBuf};
use flate2::{Compression, write::GzEncoder};
use chrono::{offset::Local, DateTime};


#[derive(Parser, Debug)]
#[clap(author, version, about, long_about = None)]
struct Args {
    #[clap(short, long)]
    source: String,
    #[clap(short, long)]
    target: String,
    #[clap(short, long)]
    backup_count: Option<u32>,
}

fn main() -> Result<(), std::io::Error>{
    let args = Args::parse();

    let source_path = PathBuf::from(&args.source);
    let target_path = PathBuf::from(&args.target); 

    let target_dir = match fs::read_dir(&target_path) {
        Ok(dir) => { dir }
        Err(e) => {
            if e.kind() == io::ErrorKind::NotFound {
                println!("Target path doesn't exist. Creating directory...");
                fs::create_dir_all(&target_path).expect("Failed to create directory at target path");

                fs::read_dir(&target_path).expect("Failed to read created target directory")
            } else {
                panic!("Could not open targetDir");
            }
        }
    };

    let abs_target_path = fs::canonicalize(&target_path).unwrap();
    
    for e in target_dir {
        let entry_path = e.unwrap().path();
        if entry_path.is_dir() {
            continue
        }
        
        let ext = entry_path.extension().unwrap().to_str().unwrap();
        if ext == "gz" {
            let backup_dir = find_or_create_backup_dir(&target_path);

            let mut new_backup_path: PathBuf = backup_dir.clone();
            let created_date: DateTime<Local> = fs::metadata(&entry_path).unwrap().modified().unwrap().into();

            new_backup_path.push(format!("{}-{}", entry_path.file_name().unwrap().to_str().unwrap(), created_date.format("%Y-%m-%d_%T")));
            fs::copy(entry_path, new_backup_path).unwrap();
        }
    }

    // TODO: Clear out older backups
    if let Some(b) = args.backup_count {
        let sorted_entries = target_dir.map(|e| {e.unwrap()});
    }

    // Zip up entire source path into a .tar.gz in target path
    let copy_path: PathBuf = [abs_target_path.as_os_str(), source_path.file_name().unwrap()].iter().collect();
    let archive = File::create(format!("{}.tar.gz", copy_path.to_str().unwrap())).unwrap();
    let enc = GzEncoder::new(archive, Compression::default());
    let mut tar = tar::Builder::new(enc);
    println!("{:?}", &source_path);
    tar.append_dir_all(PathBuf::from("./"), &source_path).unwrap();
    tar.finish().unwrap(); 

    Ok(())
}

fn find_or_create_backup_dir(target_dir: &Path) -> PathBuf {
    let backup_path: PathBuf = [target_dir.as_os_str().to_str().unwrap(), "backup"].iter().collect();
    if !backup_path.is_dir() {
        fs::create_dir(&backup_path).unwrap();
    }
    backup_path
}