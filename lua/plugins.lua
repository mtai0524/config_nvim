-- Kiểm tra xem packer.nvim đã được cài đặt hay chưa
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Khởi động Packer
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Quản lý chính nó
    -- Các plugin khác
    use 'morhetz/gruvbox' -- Giao diện màu
    use 'neovim/nvim-lspconfig' -- LSP
    use 'williamboman/mason.nvim' -- Quản lý cài đặt LSP, DAP
    use 'williamboman/mason-lspconfig.nvim'
    use 'hrsh7th/nvim-cmp' -- Plugin autocomplete
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-buffer' -- Buffer source
    use 'hrsh7th/cmp-path' -- Path source
    use 'hrsh7th/cmp-vsnip' -- Snippet source
    use 'hrsh7th/vim-vsnip' -- Snippet plugin
    use 'rafamadriz/friendly-snippets' -- Bộ snippet phổ biến
    use 'windwp/nvim-autopairs' 
       -- Thêm Telescope
    use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use 'BurntSushi/ripgrep'
    -- Tự động cài đặt plugin khi thêm mới
    if packer_bootstrap then
        require('packer').sync()
    end
end)

