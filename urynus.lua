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

    for lang, tag, body in text:gmatch(regex) do
        local block = {
            lang = lang,
            tag = tag,
            body = body
        }
        table.insert(blocks, block)
    end

    return blocks
end

local function find_snippet(blocks, tag)
    for _, block in ipairs(blocks) do
        if block.tag == "#" .. tag then
            return block
        end
    end

    return nil
end

local function run_snippet(path, tag)
    require("urynus_config")
    local blocks = get_blocks(read_file(path))
    local block = find_snippet(blocks, tag)

    if block then
        local file_name = SNIPPETS[block.lang].name
        local file = io.open(file_name, "w")
        if file then
            file:write(block.body)
            file:close()
        end

        os.execute(SNIPPETS[block.lang].script)
        os.remove(file_name)
    end
end

local function tangle_files(path)
    local blocks = get_blocks(read_file(path))
    for _, block in ipairs(blocks) do
        if block.tag:sub(1,1) ~= "#" then
            local file = io.open(block.tag, "a")
            if file then
                file:write("\n" .. block.body)
                file:close()
            end
        end
    end
end

local function main()
    local mode = arg[1]
    local path = arg[2]
    local snippet_tag

    if mode == "snip" then
        snippet_tag = arg[3]
        run_snippet(path, snippet_tag)
    elseif mode == "tangle" then
        tangle_files(path)
    end
end

main()
