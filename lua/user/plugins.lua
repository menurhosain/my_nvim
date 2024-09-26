local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup({
  function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"  -- Useful lua functions used ny lots of plugins
    use { "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" }
    --colorscheme
    use "lunarvim/darkplus.nvim"
    use "folke/tokyonight.nvim"

    -- cmp plugins
    use "hrsh7th/nvim-cmp"         -- The completion plugin
    use "hrsh7th/cmp-buffer"       -- buffer completions
    use "hrsh7th/cmp-path"         -- path completions
    use "hrsh7th/cmp-cmdline"      -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use { "hrsh7th/cmp-nvim-lsp" } -- lsp completion
    use { "hrsh7th/cmp-nvim-lua" } -- nvim-cmp source for neovim Lua API.

    -- snippets
    use "L3MON4D3/LuaSnip"             --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use { "neovim/nvim-lspconfig" }                             -- enable LSP
    use { "williamboman/mason.nvim" }                           -- simple to use language server installer
    use { "williamboman/mason-lspconfig.nvim" }                 -- mason extention
    use { "folke/trouble.nvim", "nvim-tree/nvim-web-devicons" } --for diagnostics

    -- Telescope
    use { "nvim-telescope/telescope.nvim" }

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter" }

    -- Comment
    use { "numToStr/Comment.nvim" }

    -- Git
    use { "lewis6991/gitsigns.nvim" }
    -- File explorer
    use { "kyazdani42/nvim-tree.lua" }

    -- Buffer line
    use { "akinsho/bufferline.nvim" }
    use "moll/vim-bbye"

    -- Lualine for bottom status bar
    use { 'nvim-lualine/lualine.nvim' }

    -- Fromatter
    use { "stevearc/conform.nvim" }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end,
  config = { clone_timeout = false }
})
