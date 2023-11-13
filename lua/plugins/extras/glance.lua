local M = {
  "dnlhc/glance.nvim",
  keys = {
    { "gr", "<CMD>Glance references<CR>",       desc = "Glance references" },
    { "gY", "<CMD>Glance type_definitions<CR>", desc = "Glance type_definitions" },
    { "gI", "<CMD>Glance implementations<CR>",  desc = "Glance implementations" }
  }
}

function M.config()
  require("glance").setup({
    theme = {
      enable = true,
      mode = 'auto'
    },
    border = {
      enable = true,
      top_char = "─",
      bottom_char = "─",
    }
  })
end

return M
