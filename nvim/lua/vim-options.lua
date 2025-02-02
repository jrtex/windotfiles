vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set autoindent")
vim.cmd("set syntax")
vim.cmd("set number")
vim.cmd("set rnu")
vim.cmd("set ruler")
vim.cmd("set autoindent")

vim.cmd("set ignorecase")
vim.cmd("set smartcase")

vim.g.mapleader = " "

vim.wo.number = true

vim.cmd("autocmd BufNewFile,BufRead *.keymap setfiletype c")
