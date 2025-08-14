local Path = require("plenary.path")

local M = {}

-- We want to expose this at the list level...
-- list has a config field itself and so can access this
function M.to_exact_name(value)
    return "^" .. value .. "$"
end

function M.relative_to_root(buf_name, root)
    return Path:new(buf_name):make_relative(root)
end

function M.absolute_from_root(buf_name, root)
    local abs_path = Path:new(buf_name):absolute()
    return Path:new(abs_path):make_relative(root)
end

return M
