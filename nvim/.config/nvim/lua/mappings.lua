require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

vim.keymap.set("i", "<A-h>", "<C-g>U<Left>")
vim.keymap.set("i", "<A-j>", "<C-g>U<Down>")
vim.keymap.set("i", "<A-k>", "<C-g>U<Up>")
vim.keymap.set("i", "<A-l>", "<C-g>U<Right>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
