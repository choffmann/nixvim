{pkgs, ...}: {
  extraPackages = with pkgs; [
    golangci-lint
  ];

  plugins.lsp.servers = {
    gopls = {
      enable = true;
      autostart = true;
      filetypes = ["go" "gotempl" "gowork" "gomod"];
      settings.__raw = ''
        {
          gopls = {
            completeUnimported = true,
            usePlaceholders = false,
            analyses = {
              unusedparams = true,
            },
            ['ui.inlayhint.hints'] = {
              compositeLiteralFields = true,
              constantValues = true,
              paramerterNames = true,
              rangeVariableTypes = true,
            },
          },
        }
      '';
    };
  };

  plugins.lint.lintersByFt = {
    go = ["golangci-lint"];
  };

  # TODO: Add formatter
}
