
local constantSrc = io.open("E:\\Aaron\\vscode\\Vscode-dota2-bot-script-snippets\\snippets\\constValue.txt", "r")
io.input(constantSrc)
local constants = {}
while true do
    local value = io.read("*n")
    if value then
        table.insert(constants, value)
    else
        break
    end
end
io.close(constantSrc)

local src = io.open("E:\\Aaron\\vscode\\Vscode-dota2-bot-script-snippets\\snippets\\lua_constant.json", "r")
local dstPrefix = "E:\\Aaron\\vscode\\Vscode-dota2-bot-script-snippets\\snippets\\lua_constant1"
local dst = io.open(dstPrefix..".json", "w")
io.output(dst)
io.input(src)
local i = 0
local constant = 0
local pattern = '        "body": ".+",'
while true do
    local line = io.read()
    if line then
        i = i + 1
        if i % 5 == 4 then
            local matchString = string.sub(line, 18, #line-2)
            constant = constant + 1
            local value = constants[constant]
            if value == -100 then
                value = "nil"
            end
            io.write("        \"body\": \""..matchString.." = "..value.."\",\n")
        else
            io.write(line.."\n")
        end
    else
        break
    end
end
io.close(src)
io.close(dst)
