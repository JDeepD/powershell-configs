vim.opt.termguicolors = true
require("bufferline").setup{}

-- Use Ctrl+{h, l} to switch between buffers
vim.keymap.set('n', '<c-l>', ':bn<CR>')
vim.keymap.set('n', '<c-h>', ':bp<CR>')

-- Ctrl d to delete buffer
vim.keymap.set('n', '<c-d>', ':bd<CR>:bp<CR>')
