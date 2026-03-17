vim.lsp.enable 'lua_ls'
vim.lsp.enable 'gopls'
vim.lsp.enable 'ts_ls'
vim.lsp.enable 'pyright'
vim.lsp.enable 'tailwindcss'
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('telescope-lsp-attach', { clear = true }),
  callback = function(event)
    local buf = event.buf

    local builtin = require 'telescope.builtin'
    -- Find references for the word under your cursor.
    vim.keymap.set('n', 'grr', builtin.lsp_references, { buffer = buf, desc = '[G]oto [R]eferences' })

    -- Jump to the implementation of the word under your cursor.
    -- Useful when your language has ways of declaring types without an actual implementation.
    vim.keymap.set('n', 'gri', builtin.lsp_implementations, { buffer = buf, desc = '[G]oto [I]mplementation' })

    -- Jump to the definition of the word under your cursor.
    -- This is where a variable was first declared, or where a function is defined, etc.
    -- To jump back, press <C-t>.
    vim.keymap.set('n', 'grd', builtin.lsp_definitions, { buffer = buf, desc = '[G]oto [D]efinition' })

    -- Fuzzy find all the symbols in your current document.
    -- Symbols are things like variables, functions, types, etc.
    vim.keymap.set('n', 'gO', builtin.lsp_document_symbols, { buffer = buf, desc = 'Open Document Symbols' })

    -- Fuzzy find all the symbols in your current workspace.
    -- Similar to document symbols, except searches over your entire project.
    vim.keymap.set('n', 'gW', builtin.lsp_dynamic_workspace_symbols, { buffer = buf, desc = 'Open Workspace Symbols' })

    -- Jump to the type of the word under your cursor.
    -- Useful when you're not sure what type a variable is and you want to see
    -- the definition of its *type*, not where it was *defined*.
    vim.keymap.set('n', 'grt', builtin.lsp_type_definitions, { buffer = buf, desc = '[G]oto [T]ype Definition' })
    vim.keymap.set(
      'n',
      'goi',
      function()
        vim.lsp.buf.code_action {
          apply = true,
          context = { only = { 'source.organizeImports' }, diagnostics = {} },
        }
      end,
      { buffer = buf, desc = '[O]rganize [I]mports' }
    )

    -- Remove unused imports
    vim.keymap.set(
      'n',
      'goI',
      function()
        vim.lsp.buf.code_action {
          apply = true,
          context = { only = { 'source.removeUnusedImports' }, diagnostics = {} },
        }
      end,
      { buffer = buf, desc = '[R]emove Unused [I]mports' }
    )
  end,
})
