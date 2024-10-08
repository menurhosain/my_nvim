local servers = {
  "lua_ls",
  "cssls",
  "html",
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

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  if server == "emmet_ls" then
    opts.filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug",
      "typescriptreact", "vue" }
  end

  if server == "intelephense" then
    opts.root_dir = lspconfig.util.root_pattern('wp-config.php', 'composer.json', '.git');
  end

  lspconfig[server].setup(opts)
end
