local M = {
  "j-hui/fidget.nvim",
  branch = "legacy",
}

function M.config()
  require("fidget").setup {
    window = { blend = 0 },
  }
end

return M
