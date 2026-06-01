local sysname = vim.loop.os_uname().sysname:lower()
local ok, platform = pcall(require, "platform." .. sysname)
if ok and platform.setup then
  platform.setup()
end
