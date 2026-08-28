require("config.lazy")
require("config.nvim-web-devicons")
require("config.catppuccin")
vim.cmd.colorscheme "catppuccin-frappe"
require("config.nvim-tree")
require("config.bufferline")
require("config.lualine")
require("config.blink-cmp")
require("config.conform")
require("config.telescope")

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
-- Normal jump to definition/declaration (replaces current buffer)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "Go to references" })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to implementation" })

-- Go to definition in a vertical split
vim.keymap.set('n', 'gv', function()
  vim.cmd('vsplit')
  vim.lsp.buf.definition()
end, { desc = "Go to definition in vertical split" })

-- Go to definition in a new tab
vim.keymap.set('n', 'gt', function()
  vim.cmd('tab split')
  vim.lsp.buf.definition()
end, { desc = "Go to definition in new tab" })

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

-- Telescope shortcuts
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Show trailing whitespace
vim.opt.list = true

-- Enable spell checking
vim.opt.spell = true
vim.opt.spelllang = {'en_us'}
