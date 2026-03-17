return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  config = function()
    require('conform').setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform will run multiple formatters sequentially
        python = { 'isort', 'black' },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { 'rustfmt', lsp_format = 'fallback' },
        -- Conform will run the first available formatter
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        javascriptreact = { 'prettier' }, -- for .jsx files
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' }, -- for .tsx files
        go = { 'goimports', 'gofmt' },
      },
      format_on_save = {
        timeout_ms = 500,
      },
    }
  end,
}
