local M = {
  "nvim-pack/nvim-spectre",
  event = "VeryLazy",
}

function M.config()
require('spectre').setup({
    line_sep_start = '┌--------------------------------------------------------',
    line_sep       = '└--------------------------------------------------------',
})
end

return M
