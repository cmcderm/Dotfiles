use clap::Parser;

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

    println!("{:?}", args);
}
