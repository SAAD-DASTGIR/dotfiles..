return {
    'Mofiqul/vscode.nvim',
    priority = 1000, -- Load before everything else
    config = function()
      require('vscode').setup({
        italic_comments = true,
        disable_nvimtree_bg = true,
      })
      require('vscode').load()
    end
  }
  