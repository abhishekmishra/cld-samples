local json = require("json")
local docker = require("luaclibdocker")

local d = docker.connect()
d:set_loglevel(2)

d:image_pull('alpine')

-- print(d:image_ls(false, false))
local img_ls = json.decode(d:image_ls(false, false))
for _, img in ipairs(img_ls) do
    print(img.Id .. ' --> ' .. img.RepoTags[1])
end
