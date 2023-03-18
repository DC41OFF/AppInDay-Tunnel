local http = require("socket.http")
local cjson = require "cjson"
local response_body = {}
local url = aid .. "/?uuid=" .. ngx.var.1

local res, code, response_headers = http.request {
    url = url,
    method = "GET",
    sink = ltn12.sink.table(response_body)
}

if code == 200 then
    local response_str = table.concat(response_body)
    local response = cjson.decode(response_str)
    ngx.var.revproxy = response.url .. ngx.var.1 .. "-" .. ngx.var.2
else
    print("HTTP request failed with code " .. code)
end