return {
    --  Lightbulb to show available code actions
    {
      "kosayoda/nvim-lightbulb",
      event = "LspAttach",
      opts = {
        autocmd = { enabled = true },
        sign = { enabled = true, priority = 10 },
        virtual_text = { enabled = true },
      },
    },
  
    --  Inlay hints like VS Code
    {
      "lvimuser/lsp-inlayhints.nvim",
      event = "LspAttach",
      config = function()
        require("lsp-inlayhints").setup()
        vim.api.nvim_create_autocmd("LspAttach", {
          callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            require("lsp-inlayhints").on_attach(client, args.buf)
          end,
        })
      end,
    },
  
    --  Format on save (via conform.nvim)
    {
      "stevearc/conform.nvim",
      event = { "BufWritePre" },
      config = function()
        require("conform").setup({
          format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
          },
          formatters_by_ft = {
            javascript = { "prettier" },
            typescript = { "prettier" },
            html = { "prettier" },
            lua = { "stylua" },
            go = { "gofmt" },
          },
        })
      end
    }
  }
  