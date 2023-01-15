require "user.keybindings"
require "user.options"

--Packer plugs 
require "user.plugins"
require "user.nvim-tree"
require "user.bufferline"
vim.cmd [[colorscheme gruvbox]]

--[[
local o = vim.o

--Settings
o.clipboard = "unnamedplus"
o.cursorline = true
o.expandtab = true
o.mouse='a'
o.relativenumber = true
o.number = true
o.shiftwidth = 2
o.showtabline = 2
o.smartcase = true
o.smartindent = true
o.splitbelow = true
o.splitright = true
o.tabstop = 2

----------KeyMaps ------------
local opts = {noremap = true}
local keymap = vim.api.nvim_set_keymap

--Normal Mode--
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

--Insert Mode--
keymap("i", "jk", "<ESC>", opts)local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

--CoC Completion
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
keymap("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keymap("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]****], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
keymap("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]****], opts)

--Visual Mode--
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
]]

