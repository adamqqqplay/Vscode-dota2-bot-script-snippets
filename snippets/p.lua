local src = io.open("E:\\Aaron\\vscode\\Vscode-dota2-bot-script-snippets\\snippets\\lua_constant.json", "r")
local dstPrefix = "E:\\Aaron\\vscode\\Vscode-dota2-bot-script-snippets\\snippets\\lua_constant"
local dst = io.open(dstPrefix..".lua", "w")
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
                do
                    local matchString = string.sub(line, 18, #line-2)
                    if matchString then
                        constant = constant + 1
                        if constant % 20 ~= 1 then
                            io.write(",")
                        end
                        if constant % 20 == 1 then
                            if constant ~= 1 then
                                io.write(")\n")
                            end
                            io.write("print(")
                        end
                        io.write(matchString)
                    else
                        print(line)
                    end
                end
            end
        else
            break
        end
end
io.close(src)
io.write(")\n")
io.close(dst)
