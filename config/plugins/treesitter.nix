{
  # Highlight, edit, and navigate code
  # https://nix-community.github.io/nixvim/plugins/treesitter/index.html
  plugins.treesitter = {
    enable = true;

    settings = {
      auto_install = true;
      highlight.enable = true;
      indent.enable = true;
    };
  };
}
