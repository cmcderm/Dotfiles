use clap::Parser;
use std::fs::ReadDir;
use std::{fs, fs::DirEntry};
use std::io;
use std::path::{Path, PathBuf};
// use flate2::{read::GzDecoder, write::GzEncoder};
// use tar::Archive;


#[derive(Parser, Debug)]
#[clap(author, version, about, long_about = None)]
struct Args {
    #[clap(short, long)]
    source: String,
    #[clap(short, long)]
    target: String,
}

fn main() {
    let args = Args::parse();

    let source_path = PathBuf::from(args.source);
    let target_path = PathBuf::from(args.target); 

    let source_dir = fs::read_dir(source_path).expect("Expected source path to be a valid directory");
    let target_dir = match fs::read_dir(&target_path) {
        Ok(dir) => { dir }
        Err(e) => {
            if (e.kind() == io::ErrorKind::NotFound) {
                println!("Target path doesn't exist. Creating directory...");
                fs::create_dir_all(&target_path).expect("Failed to create directory at target path");

                fs::read_dir(&target_path).expect("Failed to read created target directory")
            } else {
                panic!("Could not open targetDir");
            }
        }
    };

    // Find/Create Backup Folder in Target Path
    let backup_dir = find_or_create_backup_dir(&target_path);

    for e in target_dir {
        let entry_path = e.unwrap().path();
        
        if (entry_path.is_dir()) {

        }
    }

    for e in source_dir {
        let entry = e.unwrap();
        println!("{:?}", entry);

        let path = entry.path();
        // Archive and Compress into .tar.gz


        // Copy old copy to backup folder

        // Copy Archive To Target 
    }
}

fn find_or_create_backup_dir(target_dir: &Path) -> PathBuf {
    let backup_path: PathBuf = [target_dir.as_os_str(), std::ffi::OsStr::new("backup")].iter().collect();
    if !backup_path.is_dir() {
        fs::create_dir(&backup_path).unwrap();
    }
    backup_path
}