{ config, pkgs, ... }:

{
  home.username = "devon";
  home.homeDirectory = "/home/devon";
  home.stateVersion = "25.11";

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/devon/nixos-dotfiles/config/nvim";
    recursive = true;
  };

  programs.git = {
  	enable = true;
    settings = {
      user = {
        name = "Devon Gardner";
        email = "devon@goosur.com";
      };
      init.defaultBranch = "master";
    };
  };
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos, btw";
    };
  };
}
