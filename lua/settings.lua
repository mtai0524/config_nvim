-- Hiển thị số dòng
vim.o.number = true
vim.o.relativenumber = true

-- Tab và khoảng trắng
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Tìm kiếm
vim.o.ignorecase = true
vim.o.smartcase = true

-- Giao diện
vim.o.background = "dark"
vim.o.encoding = "utf-8"
vim.cmd("colorscheme gruvbox")

-- Cấu hình Telescope
local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,
        ["<C-c>"] = actions.close,
        ["<esc>"] = actions.close,  -- Thêm phím esc để đóng Telescope
      },
    },
  },
}
