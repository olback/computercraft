--
-- https://github.com/olback/computercraft/blob/master/utils/nano.lua
-- alias for 'edit'
-- move to ../autorun?
--

local args = { ... }
shell.run("edit " .. args[1])
