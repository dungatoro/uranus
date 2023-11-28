use clap::{ Args, Parser, Subcommand };

#[derive(Parser)]
#[clap(author, version, about)]
pub struct UrynusArgs {
    #[clap(subcommand)]
    pub action: Action,
}

#[derive(Debug, Subcommand)]
pub enum Action {
    Codify(CodeBase),
    Snip(CodeSnippet),
}

#[derive(Debug, Args)]
pub struct CodeBase {
    #[arg(short, long)]
    pub dir: String,

    #[arg(short, long)]
    pub count: i32,

    #[arg(short, long, default_value_t = String::from(""))]
    pub location: String,
}

#[derive(Debug, Args)]
pub struct CodeSnippet {
    #[arg(short, long)]
    pub file_path: String,

    #[arg(short, long)]
    pub id: String,
}
