local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true } },
  lazy = true,
  cmd = "Telescope",
}

function M.config()
  local icons = require "config.icons"
  local actions = require "telescope.actions"

  require("telescope").setup {
    defaults = {
      prompt_prefix = icons.ui.Telescope .. " ",
      selection_caret = icons.ui.Forward .. " ",
      entry_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "smart" },
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" },
      sorting_strategy = nil,
      layout_strategy = nil,
      layout_config = {},
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },

      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["q"] = actions.close,
        },
      },
    },
    pickers = {
      find_files = {
        preview_title        = "",
        file_ignore_patterns = { "assets", "node_modules", "package-lock.json", ".git/" },
        hidden               = true,
        layout_strategy      = 'horizontal',
        layout_config        = {
          horizontal = {
            width = 0.7,
            height = 0.7,
            preview_width = 0.6,
          },
        },
      },
      git_files = {
        file_ignore_patterns = { "assets", "node_modules", "package-lock.json", ".git/" },
        hidden               = true,
        show_untracked       = true,
      },
      live_grep = {
        --@usage don't include the filename in the search results
        only_sort_text = true,
        preview_title  = "",
        theme          = 'dropdown',
        layout_config  = {
          vertical = {
            width = 0.4,
            height = 0.5,
            preview_width = 0.6,
          },
        },
      },
      grep_string = {
        preview_title  = "",
        theme          = 'dropdown',
        only_sort_text = true,
        layout_config  = {
          vertical = {
            width = 0.4,
            height = 0.5,
            preview_width = 0.6,
          },
        },
      },

      buffers = {
        results_title = "",
        theme         = "ivy",
        previewer     = false,
        layout_config = {
          height = 0.2
        },

        initial_mode  = "normal",
        mappings      = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },

      planets = {
        show_pluto = true,
        show_moon = true,
      },

      colorscheme = {
        enable_preview = true,
      },

      lsp_references = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_definitions = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_declarations = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_implementations = {
        theme = "dropdown",
        initial_mode = "normal",
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      },
    },
  }
end

return M
