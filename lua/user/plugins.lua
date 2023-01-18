
----------House Keeping Functions----------
--Install Packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

--Reload Vim after new package update
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

--Protected call of Packer
local status_ok, packer = pcall(require, "packer") 
if not status_ok then
  print("Packer failed to load")
  return
end

--Float Packer manager
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float{border = "rounded"}
    end,
  },
}

----------Plugins-----------
return packer.startup(function(use)
  --Package Manager + Core Plugins
  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-tree/nvim-web-devicons"

  --Coding Tools
  use {
    'nvim-tree/nvim-tree.lua', requires={
      'nvim-tree/nvim-web-devicons',
    },
  }
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  use "moll/vim-bbye"
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
end}
  --Ease of life
  --Autocompletion
  use {"neoclide/coc.nvim", branch = 'release'}
  use {"windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end}

  --Theme and style
  use "morhetz/gruvbox"
  --use {"nvim-treesitter/nvim-treesitter", config = function() require("nvim-treesitter.install").prefer_git=false end} 

end)




