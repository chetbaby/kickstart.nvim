local nvim_lsp = require("lspconfig")

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local servers = {
    "html",
    "cssls",
    "cssmodules_ls",
    "diagnosticls",
    "stylelint_lsp",
    "tailwindcss",
    "sumneko_lua",
    "tsserver",
    "eslint",
    "graphql",
    "yamlls",
    "jsonls",
}
-- Use a loop to conveniently call 'setup' on multiple servers
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        -- capabilities = capabilities,
        settings = {
            jsonls = {
                format = {enabled = false},
                schemas = {
                    {
                        description = "ESLint config",
                        fileMatch = {".eslintrc.json", ".eslintrc"},
                        url = "http://json.schemastore.org/eslintrc"
                    }, {
                        description = "Package config",
                        fileMatch = {"package.json"},
                        url = "https://json.schemastore.org/package"
                    }, {
                        description = "Packer config",
                        fileMatch = {"packer.json"},
                        url = "https://json.schemastore.org/packer"
                    }
                }
            },
            Lua = {
                runtime = {
                    version = "LuaJIT",
                    path = vim.split(package.path, ";")
                },
                completion = {enable = true, callSnippet = "Both"},
                diagnostics = {
                    enable = true,
                    globals = {"vim", "describe", "use"},
                    disable = {"lowercase-global"}
                },
                workspace = {
                    library = {
                        vim.api.nvim_get_runtime_file("", true),
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                        [vim.fn.expand("/usr/share/awesome/lib")] = true
                    },
                    -- adjust these two values if your performance is not optimal
                    maxPreload = 2000,
                    preloadFileSize = 1000
                },
                telemetry = {enable = false}
            },
        },
        flags = {debounce_text_changes = 150}
    }
    -- require"lsp_signature".setup({
    --     bind = true, -- This is mandatory, otherwise border config won't get registered.
    --     floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
    --     doc_lines = 2, -- Set to 0 for not showing doc
    --     hint_prefix = "🐼 ",
    --     -- use_lspsaga = false,  -- set to true if you want to use lspsaga popup
    --     handler_opts = {
    --         border = "shadow" -- double, single, shadow, none
    --     }
    -- })
end

