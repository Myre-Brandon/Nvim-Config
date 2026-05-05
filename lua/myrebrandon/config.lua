vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.g.have_nerd_font = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Clears word search

vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

vim.keymap.set('n', 'c', '"_c')
vim.keymap.set('n', 'd', '"_d')

vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

vim.opt.updatetime = 300
