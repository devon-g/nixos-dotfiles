{ config, pkgs, ... }:

{
  home.username = "devon";
  home.homeDirectory = "/home/devon";
  home.stateVersion = "25.11";

  home.file.".config/nvim".source = ./config/nvim;
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
