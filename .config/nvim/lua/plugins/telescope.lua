return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules" },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      })

      telescope.load_extension("ui-select")

      vim.keymap.set('n', '<C-p>', function()
        require('telescope.builtin').find_files({
          prompt_title = "Exact File Name Search",
          file_ignore_patterns = { "node_modules" },
          sorting_strategy = "ascending",
          find_command = { "rg", "--files", "--fixed-strings", "--glob", "!*.git" }
        })
      end)


      vim.keymap.set('n', '<C-s>', function()
        require('telescope.builtin').live_grep({
          additional_args = function()
            return { "--fixed-strings" } -- treat pattern as a literal string
          end,
        })
      end)

      vim.keymap.set('n', '<C-f>', function()
        local builtin = require('telescope.builtin')
        local themes = require('telescope.themes')
        local current_file = vim.fn.expand('%:p')
        local input = vim.fn.input("Search (exact, current file): ") -- no default word

        if input == "" then
          print("No search term provided.")
          return
        end

        -- Build options for the dropdown picker
        local opts = themes.get_dropdown({
          prompt_title = "Exact Match (Current File)",
          search = input,           -- the literal search term
          search_dirs = { current_file }, -- restrict search to current file
          -- Pass options to ripgrep: literal search and ignore case
          additional_args = function()
            return { "--fixed-strings", "--ignore-case" }
          end,
        })

        builtin.grep_string(opts)
      end)
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
  }
}
sa