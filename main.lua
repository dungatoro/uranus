local function read_file(path)
    local file = io.open(path, "r")
    if file then
        local text = file:read("*all")
        file:close()
        return text
    else
        return nil
    end
end

local function get_blocks(text)
    local blocks = {}
    local regex = "```%s*([^%s]+)%s*([^%s]*)%s*\n(.-)```"

    for lang, id, body in text:gmatch(regex) do
        local block = {
            language = lang,
            id = id,
            body = body
        }
        table.insert(blocks, block)
    end

    return blocks
end

local function find_snippet(blocks, id)
    for _, block in ipairs(blocks) do
        if block.id == id then
            return block
        end
    end

    return nil
end

local function main()
    local path = "README.md"
    local text = read_file(path)
    local blocks = get_blocks(text)

    local snippet = find_snippet(blocks, "#factorial")
    if snippet then
        print("Language:", snippet.language)
        print("Identifier:", snippet.id)
        print("Body:")
        print(snippet.body)
        print("------------------------------")
    end

    --[[
    if text then
        local blocks = get_blocks(text)

        for _, block in ipairs(blocks) do
            print("Language:", block.language)
            print("Identifier:", block.id)
            print("Body:")
            print(block.body)
            print("------------------------------")
        end
    else
        print("Could not read file:", path)
    end
    --]]
end

main()

