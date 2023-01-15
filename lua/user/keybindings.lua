
--**KeyMaps --
local opts = {noremap = true}
local keymap = vim.api.nvim_set_keymap

--**Leader--
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


--**Normal Mode--
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)


--**Insert Mode--
keymap("i", "jk", "<ESC>", opts)local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

--**Visual Mode--
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

--**CoC Completion--
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
keymap("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keymap("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
keymap("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

--**NvimTree--
--keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
