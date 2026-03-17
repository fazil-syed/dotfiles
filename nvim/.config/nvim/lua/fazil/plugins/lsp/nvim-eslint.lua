return {
  'esmuellert/nvim-eslint',
  event = { 'BufReadPre', 'BufNewFile' }, -- load lazily on JS/TS files
  config = function()
    require('nvim-eslint').setup {
      -- optional settings
      debug = false,
      filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'vue',
        'svelte',
        'astro',
      },
      settings = {
        validate = 'on',
        useESLintClass = true,
        run = 'onType',
        codeAction = {
          disableRuleComment = { enable = true, location = 'separateLine' },
          showDocumentation = { enable = true },
        },
        codeActionOnSave = { mode = 'all' },
        format = false,
      },
    }
  end,
}
