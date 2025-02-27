-- BASIC CONFIG

vim.o.number = true      -- Enable line numbers
vim.o.tabstop = 4        -- Number of spaces a tab represents
vim.o.shiftwidth = 4     -- Number of spaces for each indentation
vim.o.expandtab = true   -- Convert tabs to spaces
vim.o.smartindent = true -- Automatically indent new lines
vim.opt.termguicolors = true
-- set clipboard+=unnamedplus
vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }

-- Crée un autocmd pour les fichiers .html, .css
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "*.html", "*.css" },
    callback = function()
        vim.bo.tabstop = 2
        vim.bo.softtabstop = 2
        vim.bo.shiftwidth = 2
    end
})

-- sync clipboard between os and neovim
--vim.schedule(function()
--    vim.opt.clipboard = 'unnamedplus'
--end)


return {
    {
        "EdenEast/nightfox.nvim",
        config = function()
            vim.cmd('colorscheme duskfox')
        end
    },
}
