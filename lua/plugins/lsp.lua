return {
    -- Lsp
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            require("lspconfig").lua_ls.setup { capabilities = capabilities }
            require("lspconfig").ts_ls.setup { capabilities = capabilities }

            -- Format onSave
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then return end

                    if client:supports_method('textDocument/formatting') then
                        -- Format the current buffer on save
                        vim.api.nvim_create_autocmd('BufWritePre', {
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                            end,
                        })
                    end
                end,
            })
            -- keys
            vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
    --
    {
        "williamboman/mason.nvim",
        opts = {},
    },

    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "ts_ls", "pylsp" },
        },
    },
}
