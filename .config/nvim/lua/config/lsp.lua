local group = vim.api.nvim_create_augroup('lsp_autocmds', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
  group = group,
  desc = 'LSP actions and Ruff hover disable',
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    local opts = { buffer = args.buf }

    if client.name == 'ruff' then
      client.server_capabilities.hoverProvider = false
      return
    end

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set({ 'n', 'x' }, 'gq', function() vim.lsp.buf.format({ async = true }) end, opts)
    vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>ld', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>ln', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, opts)
  end
})

-- LSP servers
local lspconfig = require('lspconfig')

lspconfig.pyright.setup({
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        ignore = { '*' },
      },
    },
  }
})

lspconfig.ruff.setup({})
