-- Cấu hình Mason
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { "omnisharp" }, -- Đảm bảo omnisharp được cài đặt
})

-- Cấu hình LSP
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.omnisharp.setup({
    cmd = { "mono", "/home/mtdev/Downloads/omnisharp/OmniSharp.exe" }, -- Đường dẫn OmniSharp
    capabilities = capabilities,
    filetypes = { "cs", "csx", "vb" },
    root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj"),
})

-- Cấu hình nvim-cmp
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter để chấp nhận gợi ý
        ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Tab để chấp nhận gợi ý
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },  -- Gợi ý từ LSP
        { name = 'buffer', keyword_length = 3 }, -- Gợi ý từ buffer
        { name = 'path' },     -- Gợi ý đường dẫn
        { name = 'vsnip' },    -- Gợi ý snippet
    }),
})
