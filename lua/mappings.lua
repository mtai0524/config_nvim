
local opts = { noremap = true, silent = true }

-- Đặt leader key nếu cần
vim.g.mapleader = " "  -- Đặt phím Leader là space

-- Phím tắt build và run
vim.api.nvim_set_keymap('n', '<leader>b', ':!dotnet build<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>r', ':!dotnet run<CR>', opts)

-- Phím tắt cho Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', opts)

