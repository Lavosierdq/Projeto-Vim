-- vim.cmd "colorscheme darkblue"

-- define o esquema de cores e protege a escolha.
local colorscheme = "tokyonight-moon"

local status_ok, _ = pcall(vim.cmd, "colorscheme" .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
