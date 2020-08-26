require "luaclibdocker"
local Dockerfile = require "dockerfile"

local df = Dockerfile:new()
            :from("alpine:latest")
            :run_shell({"ls", "-al"})

print (df:contents())

df:write('Dockerfile')