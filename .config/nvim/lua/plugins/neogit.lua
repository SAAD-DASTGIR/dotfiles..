return {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim', -- this enables VS Code-style side-by-side diffs
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", function() require("neogit").open() end, desc = "Open Neogit" },
    },
    config = function()
      require("neogit").setup {
        integrations = {
          diffview = true
        }
      }
    end
  }
  