require("config.lazy")
require("config.nvim-web-devicons")
require("config.catppuccin")
vim.cmd.colorscheme "catppuccin-frappe"
require("config.nvim-tree")
require("config.bufferline")
require("config.lualine")
require("config.blink-cmp")
require("config.conform")

-- Misc options
vim.o.number = true
vim.o.cursorline = true
vim.o.expandtab = true
-- 80 character limit
vim.o.colorcolumn = '80'
-- tab size is 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- LSP settings
vim.lsp.config['cpp'] = {
  cmd = { 'clangd' },
  root_markers = { '.git', '.clangd', 'compile_commands.json' },
  filetypes = { 'c', 'cpp' },
}
vim.lsp.enable('cpp')
vim.diagnostic.config({ virtual_text = true })

-- Key mappings
-- `: bring up a terminal
vim.keymap.set("n", "`", ":term<CR>")
-- <leader>+n: next buffer
vim.keymap.set("n", "<leader>n", ":bn<CR>")
-- <leader>+p: previous buffer
vim.keymap.set("n", "<leader>p", ":bp<CR>")
--<leader>+d: delete buffer
vim.keymap.set("n", "<leader>d", ":bd<CR>")
-- <leader>+Esc: exit terminal mode
vim.keymap.set("t", "<leader><Esc>", "<C-\\><C-n>")
-- <leader>+r: rename symbol
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
