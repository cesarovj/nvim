local M = {
  "karb94/neoscroll.nvim",
}

function M.config()
  require("neoscroll").setup {
    stop_eof = true,
    easing_function = "sine",
  }
end

return M
