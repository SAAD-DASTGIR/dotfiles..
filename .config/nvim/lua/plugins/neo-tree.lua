return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- For file type icons
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Setup web-devicons with default icons
    require("nvim-web-devicons").setup({ default = true })

    -- Configure Neo-tree with more appealing visuals
    require("neo-tree").setup({
      close_if_last_window = true,
      enable_git_status = true,
      enable_diagnostics = true,
      filesystem = {
        filtered_items = {
          visible = true, -- show dotfiles and filtered files
        },
        follow_current_file = {
          enabled = true,                       -- follow file when moved in buffer
        },
        group_empty_dirs = true,                -- show deeply nested folders
        hijack_netrw_behavior = "open_default", -- open tree on startup
        use_libuv_file_watcher = true,          -- auto update tree when files change
      },
      renderer = {
        highlight_opened_files = "name", -- Highlight opened files
        icons = {
          glyphs = {
            -- Default icon for files
            default = "", -- Default file icon

            -- Specific icons for different file types
            ["*.js"] = "", -- JavaScript
            ["*.ts"] = "", -- TypeScript
            ["*.json"] = "", -- JSON
            ["*.css"] = "", -- CSS
            ["*.html"] = "", -- HTML
            ["*.svg"] = "ﰟ", -- SVG
            ["*.py"] = "", -- Python
            ["*.go"] = "", -- Go
            ["*.lua"] = "", -- Lua
            ["*.java"] = "", -- Java
            ["*.md"] = "", -- Markdown
            ["*.yml"] = "", -- YAML
            ["*.sh"] = "", -- Shell script
            ["*.xml"] = "", -- XML
            ["*.csv"] = "", -- CSV file
            ["*.txt"] = "", -- Text file
            -- Add more specific file types here

            -- Git status icons
            git = {
              unstaged = "✗", -- Unstaged git file
              staged = "✓", -- Staged git file
              untracked = "★", -- Untracked file
              renamed = "➜", -- Renamed file
              deleted = "", -- Deleted file
              ignored = "◌", -- Ignored file
            },
          },
        },
      },
    })

    -- Keymap for toggling the file explorer
    vim.keymap.set('n', '<C-e>', ":Neotree toggle<CR>", {})
  end
}
