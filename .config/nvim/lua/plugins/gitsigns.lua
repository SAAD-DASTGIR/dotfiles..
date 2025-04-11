return {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('gitsigns').setup {
        signs              = {
          add          = { text = '│' },
          change       = { text = '│' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signcolumn         = true, -- Show git signs in the sign column
        numhl              = false, -- Highlight line numbers instead
        linehl             = false, -- Highlight the entire line
        word_diff          = false, -- Show word-level differences
        watch_gitdir       = {
          interval = 1000,
          follow_files = true
        },
        current_line_blame = false, 
        preview_config     = {
          border = "rounded",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1
        },
        yadm               = { enable = false }
      }
    end
  }
  