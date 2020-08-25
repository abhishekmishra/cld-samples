local json = require("json")
local docker = require("luaclibdocker")
local CLD = require("cld")

local d = docker.connect()
d:set_loglevel(2)
local cld = CLD:new(d)

print("---------------------------------------------------")
print("Container list as JSON from clibdocker")
-- use clibdocker to get json output for containers list
local ctr_ls_str = d:container_ls_filter(false, 0, false, json.encode(nil))
local ctr_ls = json.decode(ctr_ls_str)
print(ctr_ls_str)

-- use CLD library to list containers
print("---------------------------------------------------")
print("container list from CLD")
local ls_options = {
    ["all"] = {["val"] = false},
    ["filter"] = {["val"] = nil},
    ["format"] = {["val"] = nil},
    ["last"] = {["val"] = 0},
    ["latest"] = {["val"] = false},
    ["no-trunc"] = {["val"] = false},
    ["quiet"] = {["val"] = false},
    ["size"] = {["val"] = false}
}
local output = cld:run("container", "ls", ls_options)
-- print(output)
