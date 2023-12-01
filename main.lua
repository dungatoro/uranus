-- Function to read a file and return its content
function read_file(file_path)
    local file = io.open(file_path, "r")
    if file then
        local content = file:read("*all")
        file:close()
        return content
    else
        return nil
    end
end

-- Function to extract code blocks from Markdown using regex
function extract_code_blocks(markdown_content)
    local code_blocks = {}
    local pattern = "```%s*([^%s]+)%s*([^%s]*)%s*\n(.-)```"
    
    for lang, identifier, body in markdown_content:gmatch(pattern) do
        local code_block = {
            language = lang,
            identifier = identifier,
            body = body
        }
        table.insert(code_blocks, code_block)
    end
    
    return code_blocks
end

-- Main function
function main()
    local file_path = "README.md"
    local markdown_content = read_file(file_path)

    if markdown_content then
        local code_blocks = extract_code_blocks(markdown_content)

        -- Print the extracted code blocks
        for _, block in ipairs(code_blocks) do
            print("Language:", block.language)
            print("Identifier:", block.identifier)
            print("Body:")
            print(block.body)
            print("------------------------------")
        end
    else
        print("Error reading the file.")
    end
end

-- Run the main function
main()

