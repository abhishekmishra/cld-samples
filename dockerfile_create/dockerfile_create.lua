require "luaclibdocker"
local Dockerfile = require "dockerfile"

local df = Dockerfile:new()
            :from("alpine:latest")
            :run_shell({"ls", "-al"})

print (df:contents())

local dfile = io.open('Dockerfile', 'w')
dfile:write(df:contents())
dfile:close()