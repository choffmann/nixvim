{pkgs, ...}:
{
  # Import all your configuration modules here
  imports = [ 
    ./colorschemes.nix
    ./plugins/oil.nix
    ./plugins/which-key.nix
    ./plugins/conform.nix
    ./plugins/treesitter.nix
    ./plugins/lsp.nix
    ./plugins/telescope.nix
    ./plugins/mini.nix
    ./plugins/nvim-cmp.nix
    ./plugins/gitsigns.nix
  ];

  globals = {
    mapleader = " ";
    maplocalleader = " ";

    have_nerd_font = true;
  };

  clipboard = {
    providers = {
      wl-copy.enable = true; # For Wayland
      xsel.enable = true; # For X11
    };
  };

  opts = {
    # Show line numbers
    number = true;
    relativenumber = true;

    # Enable mouse mode, can be useful for resizing splits for example!
    mouse = "a";

    # Don't show the mode, since it's already in the statusline
    showmode = false;

    # Enable break indent
    breakindent = true;

    # Save undo history
    undofile = true;

    # Case-insensitive searching UNLESS \C or one or more capital letters in search term
    ignorecase = true;
    smartcase = true;

    # Keep signcolumn on by default
    signcolumn = "yes";

    # Decrease update time
    updatetime = 250;

    # Decrease mapped sequence wait time
    # Displays which-key popup sooner
    timeoutlen = 300;

    # Configure how new splits should be opened
    splitright = true;
    splitbelow = true;

    # Sets how neovim will display certain whitespace characters in the editor
    #  See `:help 'list'`
    #  See `:help 'listchars'`
    # list = true;
    # listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";

    # Preview subsitutions live, as you type!
    inccommand = "split";

    # Show which line your cursor is on
    cursorline = true;

    # Minimal number of screen lines to keep above and below the cursor
    scrolloff = 10;

    # Set highlight on search, but clear on pressing <Esc> in normal mode
    hlsearch = true;

    expandtab = true;
    softtabstop = 2;
  };

  keymaps = [
    {
      mode = "n";
      key = "<left>";
      action = "<Nop>";
    }
    {
      mode = "n";
      key = "<right>";
      action = "<Nop>";
    }
    {
      mode = "n";
      key = "<up>";
     action = "<Nop>";
    }
    {
      mode = "n";
      key = "<down>";
      action = "<Nop>";
    }
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w><C-h>";
      options = { desc = "Move focus to the left window"; };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w><C-l>";
      options = { desc = "Move focus to the right window"; };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w><C-j>";
      options = { desc = "Move focus to the lower window"; };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w><C-k>";
      options = { desc = "Move focus to the upper window"; };
    }
    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
      options = { desc = "Move down half a page"; };
    }
    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
      options = { desc = "Move up half a page"; };
    }
    {
      mode = "n";
      key = "n";
      action = "nzzzv";
      options = { desc = "Move to next search result and center it"; };
    }
    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
      options = { desc = "Move to previous search result and center it"; };
    }
    {
      mode = "n";
      key = "<leader>zig";
      action = "<cmd>LspRestart<cr>";
      options = { desc = "Restart the LSP server"; };
    }
    {
      mode = "x";
      key = "<leader>p";
      action = "\"_dP";
      options = { desc = "Paste from system clipboard"; };
    }
    {
    mode = ["n" "v"];
      key = "<leader>y";
      action = "\"+y";
      options = { desc = "Yank to system clipboard"; };
    }
    {
      mode = "n";
      key = "<leader>Y";
      action = "\"+Y";
      options = { desc = "Yank to system clipboard"; };
    }
    {
      mode = ["n" "v"];
      key = "<leader>d";
      action = "\"_d";
      options = { desc = "Delete without yanking"; };
    }
    {
      mode = "n";
      key = "<leader>s";
      action = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>";
      options = { desc = "Substitute word under cursor"; };
    }
    {
      mode = ["n" "v"];
      key = "<A-j>";
      action = ":m '>+1<CR>gv=gv";
      options = { desc = "Move line down"; };
    }
    {
      mode = ["n" "v"];
      key = "<A-k>";
      action = ":m '<-2<CR>gv=gv";
      options = { desc = "Move line up"; };
    }
    {
      mode = "n";
      key = "<Tab>";
      action = ">>";
      options = {
        desc = "Indent line";
        noremap = true;
      };
    }
    {
      mode = "n";
      key = "<S-Tab>";
      action = "<<";
      options = {
        desc = "Unindent line";
        noremap = true;
      };
    }
  ];

  autoCmd = [
    {
      event = ["TextYankPost"];
      desc = "Highlight when yanking (copying) text";
      callback.__raw = ''
        function()
          vim.highlight.on_yank()
        end
      '';
    }
  ];

  userCommands = {
    W.command = "w";
    Wa.command =  "wa";
    Wqa.command =  "wqa";
    Q.command = "q";
  };

  plugins = {
    # Detect tabstop and shiftwidth automatically
    # https://nix-community.github.io/nixvim/plugins/sleuth/index.html
    sleuth = {
      enable = true;
    };

    # "gc" to comment visual regions/lines
    # https://nix-community.github.io/nixvim/plugins/comment/index.html
    comment = {
      enable = true;
    };

    # Highlight todo, notes, etc in comments
    # https://nix-community.github.io/nixvim/plugins/todo-comments/index.html
    todo-comments = {
      enable = true;
      settings = {
        signs = true;
      };
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    # Useful for getting pretty icons, but requires a Nerd Font.
    nvim-web-devicons # TODO: Figure out how to configure using this with telescope
  ];

  extraConfigLuaPre = ''
    if vim.g.have_nerd_font then
      require('nvim-web-devicons').setup {}
    end
  '';
}
