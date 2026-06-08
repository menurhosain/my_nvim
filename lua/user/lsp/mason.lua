local servers = {
  "lua_ls",
  "emmet_ls",
  "ts_ls",
  "dockerls",
  "docker_compose_language_service",
  "intelephense",
  "jsonls",
  -- "solidity",
  -- "solc",
  "rust_analyzer"
}

local settings = {
  ui = {
    border = "none",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  if server == "emmet_ls" then
    opts.filetypes = {
      "css", "html", "javascript", "javascriptreact",
      "less", "sass", "scss", "svelte", "pug",
      "typescript", "typescriptreact", "vue", "php"
    }
  end

  if server == "intelephense" then
    opts.root_markers = { 'wp-config.php', 'composer.json', '.git' }
  end

  vim.lsp.config(server, opts);
end

require("mason-tool-installer").setup({
  ensure_installed = {
    "prettierd",
    "prettier",
    "php-cs-fixer",
  },
  auto_update = false,
  run_on_start = true,
})
