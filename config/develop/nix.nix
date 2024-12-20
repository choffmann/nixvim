{pkgs, ...}: {
  extraPackages = with pkgs; [
    alejandra
    nixd
  ];

  plugins.lsp.servers = {
    nixd = {
      enable = true;
      settings = let
        flake = ''(builtins.getFlake "github:choffmann/nixos-config)""'';
      in {
        nixpkgs = {
          expr = "import ${flake}.inputs.nixpkgs { }";
        };
        formatting = {
          command = ["alejandra"];
        };
      };
    };
  };
}
