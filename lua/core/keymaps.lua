vim.g.mapleader = " "

local map = vim.keymap.set

-- Keep cursor centered when jumping
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Move selected lines up/down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- System clipboard
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

-- Paste without overwriting clipboard
map("x", "<leader>p", [["_dP]])

-- Delete to void register
map({ "n", "v" }, "<leader>d", [["_d]])

-- Quick escape from terminal
map("t", "<Esc>", "<C-\\><C-n>")
