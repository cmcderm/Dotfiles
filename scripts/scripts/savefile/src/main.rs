use clap::Parser;

#[derive(Parser, Debug)]
#[clap(author, version, about, long_about = None)]
struct Args {
    #[clap(short, long)]
    sourcePath: String,
    #[clap(short, long)]
    targetPath: String,
}

fn main() {
    let args = Args::parse();

    println!("{:?}", args);
}
