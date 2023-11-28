use std::fs::File;
use std::io::{self, Read};
use regex::Regex;

#[derive(Debug)]
struct CodeBlock {
    lang: String,
    id: String,
    text: String,
}

fn extract_code_blocks(path: &str) -> Result<Vec<CodeBlock>, io::Error> {
    // Read the entire contents of the file
    let mut file = File::open(path)?;
    let mut content = String::new();
    file.read_to_string(&mut content)?;

    // Regular expression for matching code blocks
    let re = Regex::new(r"```([^\s]+)\s+([^\s]+)\s+([\s\S]*?)```").expect("Invalid regular expression");

    // Extract code blocks using the regular expression
    let mut code_blocks = Vec::new();
    for capture in re.captures_iter(&content) {
        if let (Some(lang), Some(ident), Some(body)) =
            (capture.get(1), capture.get(2), capture.get(3))
        {
            let code_block = CodeBlock {
                lang: lang.as_str().to_string(),
                id: ident.as_str().to_string(),
                text: body.as_str().to_string(),
            };
            code_blocks.push(code_block);
        }
    }
    Ok(code_blocks)
}

fn main() {
    let file_path = "README.md";
}
