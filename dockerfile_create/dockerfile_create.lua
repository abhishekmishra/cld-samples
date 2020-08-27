require "luaclibdocker"
local Dockerfile = require "dockerfile"

local df = Dockerfile:new()
            :from("alpine:latest")
            :run_shell({"apk", "add", "vim"})
            :cmd_shell("vim")

print (df:contents())

df:write('Dockerfile')