local M = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-jest"
  },
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>tn"] = { "<cmd>lua require('neotest').run.run()<cr>", "Test Nearest" },
    ["<leader>tf"] = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Test File" },
    ["<leader>tT"] = { "<cmd>lua require('neotest').run.run(vim.loop.cwd())<cr>", "Test All Files" },
    ["<leader>ts"] = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop Test" },
    ["<leader>tS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Toggle Summary" },
    ["<leader>to"] = { "<cmd>lua require('neotest').output.open({ enter = true, auto_close = true })<cr>", "Show Output" },
    ["<leader>tO"] = { "<cmd>lua require('neotest').output_panel.toggle()<cr>", "Toggle Output Panel" },
    ["<leader>tw"] = { "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>", "Test Watch" },
    ["<leader>tc"] = { "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --coverage ' })<cr>", "Test Coverage" },
  }

  -- get neotest namespace (api call creates or returns namespace)
  local neotest_ns = vim.api.nvim_create_namespace("neotest")

  vim.diagnostic.config({
    virtual_text = {
      format = function(diagnostic)
        local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
        return message
      end,
    },
  }, neotest_ns)

  ---@diagnostic disable-next-line: missing-fields
  require("neotest").setup {
    -- your neotest config here
    adapters = {
      require('neotest-jest')({
        jestCommand = "npm test --",
        jestConfigFile = "custom.jest.config.ts",
        env = { CI = true },
        cwd = function(path)
          return vim.fn.getcwd()
        end,
      }),
    },
    icons = {
      child_indent = "│",
      child_prefix = "├",
      collapsed = "─",
      expanded = "╮",
      failed = "✘",
      final_child_indent = " ",
      final_child_prefix = "╰",
      non_collapsible = "─",
      passed = "✓",
      running = "",
      running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
      skipped = "↓",
      unknown = "",
    },
    status = {
      enabled = true,
      signs = true,
      virtual_text = true,
    },
    floating = {
      enabled = true,
      border = "rounded",
      max_height = 0.9,
      max_width = 0.9,
      options = {},
    },
  }
end

return M
