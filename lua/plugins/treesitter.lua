return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "css",
                "dockerfile",
                "gitignore",
                "html",
                "http",
                "javascript",
                "jsdoc",
                "json",
                "json5",
                "jsonc",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "python",
                "regex",
                "sql",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
            },
            config = function(_, opts)
                require("nvim-treesitter.configs").setup(opts)

                -- MDX
                vim.filetype.add({
                    extension = {
                        mdx = "mdx",
                    },
                })
                vim.treesitter.language.register("markdown", "mdx")
            end,
        },
    },
    {
        "nvim-treesitter/playground",
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        enabled = false,
    },
    {
        "windwp/nvim-ts-autotag",
    },
}
