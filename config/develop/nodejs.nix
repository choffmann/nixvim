{pkgs, ...}:
{
  extraPackages = with pkgs; [
    fnm
    nodejs
    yarn
    eslint
    typescript
  ];

  plugins.lsp.servers = {
    ts_ls = {
      enable = true;
    };
  };

  plugins.lint.lintersByFt = {
      typescript = [ "eslint" ];
  };

  # TODO: Add formatter
}
