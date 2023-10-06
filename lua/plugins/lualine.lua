local M = {
  "nvim-lualine/lualine.nvim",
}

function M.config()
  local sl_hl = vim.api.nvim_get_hl_by_name("StatusLine", true)
  local icons = require "config.icons"
  local diff = {
    "diff",
    colored = true,
    symbols = { added = icons.git.LineAdded, modified = icons.git.LineModified, removed = icons.git.LineRemoved }, -- Changes the symbols used by the diff.
  }

  require("lualine").setup {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      ignore_focus = { "NvimTree" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = { diff },
      lualine_x = {
        {
          "filetype",
          icon_only = true,
          separator = "",
          padding = {
            left = 1, right = 0 }
        },
        {
          "filename",
          path = 1,
          symbols = {
            modified = "  ",
            readonly = "  ",
            unnamed = ""
          }
        },

      },
      lualine_y = {
        { "diagnostics", sources = { "nvim_lsp" }, symbols = { error = " ", warn = " ", info = " " } },
      },
      lualine_z = {

      },
    },
    extensions = { "quickfix", "man", },
  }
end

return M
