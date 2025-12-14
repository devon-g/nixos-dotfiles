{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    nvim = "nvim";
  };
in

{
  imports = [
    ./modules/neovim.nix
  ];

  home.username = "devon";
  home.homeDirectory = "/home/devon";
  home.stateVersion = "25.11";

  # Map nixos-dotfiles/config to $XDG_HOME/config
  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  # Configure programs
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
