{pkgs, ...}:
{
  extraPackages = with pkgs; [
    go
    golangci-lint
  ];

  plugins.lsp.servers = {
    gopls = {
      enable = true;
    };
  };

  plugins.lint.lintersByFt = {
      go = [ "golangci-lint" ];
  };
}
