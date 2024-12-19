{
  plugins.web-devicons.enable = true;
  plugins.oil = {
    enable = true;
    settings = {
      view_options.show_hidden = true;
      float.border = "rounded";
    };
    keymaps = {
      "y." = "actions.copy_entry_path";
    };
  };

  keymaps = [{
    action = "<CMD>Oil --float<CR>";
    key = "-";
    mode = "n";
    options.desc = "Open Oil";
  }];
}
