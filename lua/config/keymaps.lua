local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-Space>", "<cmd>WhichKey \\<space><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- Navigate to NvimTree
keymap("n", "<S-Tab>",  "<C-w>h", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Move to start/end of line 
keymap({"n", "x", "o"}, "H", '^', opts)
keymap({"n", "x", "o"}, "L", '$', opts)

-- Map enter to ciw in normal mode
keymap("n", "<CR>", "ciw", opts)
keymap("n", "<BS>", "ci", opts)

-- Keep cursor centered when scrolling
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Navigate buffers
keymap("n", "<Right>", ":bnext<CR>", opts)
keymap("n", "<Left>", ":bprevious<CR>", opts)

-- Select all
keymap('n', '<C-a>', 'ggVG', opts)

-- copy everything between { and } including the brackets
keymap("n", "YY", "va{Vy", opts)

-- move highlighted text up or down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- keep copied text
keymap("v", ".p", "\"_dP", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

vim.cmd [[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]]
vim.cmd [[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]]

vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")
