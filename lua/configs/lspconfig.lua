-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"


-- EXAMPLE
local servers = { "html", "cssls" ,"tailwindcss"}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config             
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

--configuring single server, example: typescript
lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- Add Tailwind CSS LSP
lspconfig.tailwindcss.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- Enable TailwindCSS color previews in nvim-cmp
local cmp = require("cmp")

cmp.setup {
  formatting = {
    format = require("tailwindcss-colorizer-cmp").formatter
  }
}