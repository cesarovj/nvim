local M = {
  "sainnhe/gruvbox-material",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  vim.o.background = "dark"
  vim.g.gruvbox_material_background = "hard"
  vim.g.gruvbox_material_transparent_background = 1
  vim.cmd.colorscheme 'gruvbox-material'
end

return M
