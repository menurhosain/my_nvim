local status_ok, conform = pcall(require, "conform")
if not status_ok then
  return
end

conform.setup({
  -- Map of filetype to formatters
  formatters_by_ft = {
    -- lua = { "stylua" },
    -- -- Conform will run multiple formatters sequentially
    -- go = { "goimports", "gofmt" },
    -- Use a sub-list to run only the first available formatter
    -- Keke sure install this formatter with mason
    javascript = { { "prettierd", "prettier" } },
    javascriptreact = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    typescriptreact = { { "prettierd", "prettier" } },
    html = { { "prettierd", "prettier" } },
    css = { { "prettierd", "prettier" } },
    scss = { { "prettierd", "prettier" } },
    less = { { "prettierd", "prettier" } },
  },
  -- If this is set, Conform will run the formatter on save.
  -- It will pass the table to conform.format().
  -- This can also be a function that returns the table.
  format_on_save = {
    -- I recommend these options. See :help conform.format for details.
    lsp_fallback = true,
    timeout_ms = 500,
  },
  -- If this is set, Conform will run the formatter asynchronously after save.
  -- It will pass the table to conform.format().
  -- This can also be a function that returns the table.
  -- format_after_save = {
  --   lsp_fallback = true,
  -- },
  -- Set the log level. Use `:ConformInfo` to see the location of the log file.
  log_level = vim.log.levels.ERROR,
  -- Conform will notify you when a formatter errors
  notify_on_error = true,
})

