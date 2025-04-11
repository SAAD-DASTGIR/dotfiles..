return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "gopls", "lua_ls", "angularls" },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Lua and Go
      lspconfig.lua_ls.setup({})
      lspconfig.gopls.setup({})

      -- Angular
      lspconfig.angularls.setup({
        cmd = {
          "ngserver",
          "--stdio",
          "--tsProbeLocations",
          "./node_modules",
          "--ngProbeLocations",
          "./node_modules"
        },
        on_new_config = function(new_config, _)
          new_config.cmd = {
            "ngserver",
            "--stdio",
            "--tsProbeLocations",
            "./node_modules",
            "--ngProbeLocations",
            "./node_modules"
          }
        end,
        filetypes = { "typescript", "html" },
        root_dir = lspconfig.util.root_pattern("angular.json", "project.json"),
      })

      -- LSP keymaps
      vim.keymap.set('n', '<C-h>', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<C-d>', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<C-a>', vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<C-S-f>', vim.lsp.buf.format, {})
    end
  }
}
