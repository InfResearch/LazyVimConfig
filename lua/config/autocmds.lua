-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local opts = { noremap = true, silent = true }
if not vim.g.vscode then
    -- recommended mappings
    -- resizing splits
    -- these keymaps will also accept a range,
    -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
    -- vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
    -- vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
    -- vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
    -- vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
    -- moving between splits
    vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
    vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
    vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
    vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
    -- vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)
    -- swapping buffers between windows
    vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
    vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
    vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
    vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
end

vim.api.nvim_set_keymap("n", "gw", ":w<CR>", opts) 
vim.api.nvim_set_keymap("n", "gq", ":q<CR>", opts)

-- Clear search highlight with gm
vim.keymap.set("n", "gm", ":nohlsearch<CR>", opts)

vim.keymap.set("n", "gn", function()
  vim.fn.setreg("/", "\\<" .. vim.fn.expand("<cword>") .. "\\>")
  vim.cmd("set hlsearch")
end, { silent = true })

vim.keymap.set("i", "jk", "<Esc>", opts)
vim.keymap.set("t", "jk", "<C-\\><C-n>", opts)

vim.keymap.set("n", "<leader>fu", function()
    vim.cmd("edit!")
    vim.cmd("e ++ff=unix")
    vim.notify("Fileformat: LF (unix)")
end, { desc = "Set LF" })

vim.keymap.set("n", "<leader>fd", function()
    vim.cmd("e ++ff=dos")
    vim.notify("Fileformat: CRLF (dos)")
end, { desc = "Set CRLF" })
