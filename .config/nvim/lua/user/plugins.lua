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
return packer.startup(function(use)
  -- My plugins here

  -- Have packer manage itself
  use { "wbthomason/packer.nvim", commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422" }

  -- Useful lua functions used by lots of plugins
  use { "nvim-lua/plenary.nvim", commit = "968a4b9afec0c633bc369662e78f8c5db0eba249" }

  -- Comment
  -- Smart and Powerful commenting plugin for neovim
  use { "numToStr/Comment.nvim", commit = "2c26a00f32b190390b664e56e32fd5347613b9e2" }
  -- Setting the commentstring option based on the cursor location in the file.
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269" }

  -- File Explorer
  -- A File Explorer For Neovim Written In Lua
  use { "kyazdani42/nvim-tree.lua", commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243" }
  -- A lua fork of vim-devicons.
  use { "kyazdani42/nvim-web-devicons", commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e" }

  -- Buffer
  -- A snazzy buffer line (with tabpage integration) for Neovim built using lua.
  use { "akinsho/bufferline.nvim", commit = "c78b3ecf9539a719828bca82fc7ddb9b3ba0c353" }
  -- Delete buffers (close files) without closing your windows or messing up your layout.
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }

  -- Layout
  -- A blazing fast and easy to configure Neovim statusline written in Lua.
  use { "nvim-lualine/lualine.nvim", commit = "3362b28f917acc37538b1047f187ff1b5645ecdd" }

  -- Tools
  -- Persist and toggle multiple terminals during an editing session
  use { "akinsho/toggleterm.nvim", commit = "aaeed9e02167c5e8f00f25156895a6fd95403af8" }
  -- Provides superior project management.
  use { "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" }
  -- Speed up loading Lua modules in Neovim to improve startup time.
  use { "lewis6991/impatient.nvim", commit = "969f2c5c90457612c09cf2a13fee1adaa986d350" }
  -- A fast and fully customizable greeter for neovim.
  use { "goolord/alpha-nvim", commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94" }
  --snippet engine
  use { "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" }
  -- a bunch of snippets to use
  use { "rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617" }

  -- Code
  -- Adds indentation guides to all lines (including empty lines).
  use { "lukas-reineke/indent-blankline.nvim", commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2" }
  -- Autopairs, integrates with both cmp and treesitter
  use { "windwp/nvim-autopairs", commit = "fa6876f832ea1b71801c4e481d8feca9a36215ec" }

  -- Colorschemes
  use { "folke/tokyonight.nvim", commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb" }
  use { "lunarvim/darkplus.nvim", commit = "2584cdeefc078351a79073322eb7f14d7fbb1835" }

  -- cmp plugins
  -- A completion engine plugin for neovim written in Lua.
  use { "hrsh7th/nvim-cmp", commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a" }
  -- buffer completions
  use { "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" }
  -- path completions
  use { "hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" }
  -- snippet completions
  use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }
  -- lsp completions
  use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
  -- neovim Lua API completions
  use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }

  -- LSP
  -- Configs for the Nvim LSP client 
  use { "neovim/nvim-lspconfig", commit = "148c99bd09b44cf3605151a06869f6b4d4c24455" }
  -- simple to use language server installer
  use { "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" }
  -- Inject LSP diagnostics, code actions, and more via Lua.
  use { "jose-elias-alvarez/null-ls.nvim", commit = "ff40739e5be6581899b43385997e39eecdbf9465" }
  --  automatically highlighting using either LSP, Tree-sitter, or regex matching.
  use { "RRethy/vim-illuminate", commit = "c82e6d04f27a41d7fdcad9be0bce5bb59fcb78e5" }
  -- Portable package manager for Neovim that runs everywhere Neovim runs.
  use { "williamboman/mason.nvim", commit = "8de637a2b02a7a996d52b4f817e8c9193943e914" }
  -- A tree like view for symbols in Neovim using the Language Server Protocol.
  use { "simrat39/symbols-outline.nvim" }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    commit = "518e27589c0463af15463c9d675c65e464efc2fe",
  }

  -- Telescope
  use { "nvim-telescope/telescope.nvim", commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0" }

  -- Git
  use { "lewis6991/gitsigns.nvim", commit = "c18e016864c92ecf9775abea1baaa161c28082c3" }


  -- DAP
  -- use { "mfussenegger/nvim-dap", commit = "014ebd53612cfd42ac8c131e6cec7c194572f21d" }
  -- use { "rcarriga/nvim-dap-ui", commit = "d76d6594374fb54abf2d94d6a320f3fd6e9bb2f7" }
  -- use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }

  -- A smooth scrolling neovim plugin written in lua
  use { "karb94/neoscroll.nvim" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
