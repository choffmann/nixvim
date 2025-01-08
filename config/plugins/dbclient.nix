{pkgs, ...}: {
  extraPackages = with pkgs; [
    postgresql
  ];

  plugins.vim-dadbod.enable = true;
  plugins.vim-dadbod-completion.enable = true;
  plugins.vim-dadbod-ui.enable = true;
}
