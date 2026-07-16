-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.fn.executable("pwsh") == 1 then
  LazyVim.terminal.setup("pwsh")
end
vim.g.autoformat = false

vim.diagnostic.enable(false)
vim.opt.clipboard = ""

vim.opt.list = true
vim.opt.listchars = {
  eol = "↵",
  tab = "»·",
  space = "·",
}

vim.opt.spell = true
vim.opt.spelllang = {"en", "cjk"}

vim.opt.wildignore:append({
  "*.meta",
  "*.csproj",
  "*.sln",
  "Library/*",
  "Temp/*",
  "Logs/*",
  "UserSettings/*",
  "obj/*",
})

if vim.g.neovide then
    -- vim.g.neovide_fullscreen = true
    vim.o.guifont = "CaskaydiaMono Nerd Font:h11"
    vim.keymap.set('n', '<F11>', function()
        vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
    end, { silent = true })
end

