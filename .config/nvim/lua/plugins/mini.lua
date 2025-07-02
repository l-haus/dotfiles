return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.files").setup({ mappings = { show_help = 'gh' } })
      require("mini.pick").setup({})
      -- require("mini.snippets").setup({})
      require("mini.completion").setup({})

      vim.keymap.set('n', '<leader>e', function() MiniFiles.open() end, {desc = 'File explorer'})
      vim.keymap.set('n', '<leader><space>', '<cmd>Pick buffers<cr>', {desc = 'Search open files'})
      vim.keymap.set('n', '<leader>ff', '<cmd>Pick files<cr>', {desc = 'Search all files'})
      vim.keymap.set('n', '<leader>fh', '<cmd>Pick help<cr>', {desc = 'Search help tags'})
    end,
  }
}
