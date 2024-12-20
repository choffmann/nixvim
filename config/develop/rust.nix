{
  plugins.lsp.servers = {
    rust_analyzer = {
      enable = true;
      installCargo = true;
      installRustc = true;
    };
  };

  plugins.lint.lintersByFt = {
      rust = [ "clippy" ];
  };

  # TODO: Add formatter
}
