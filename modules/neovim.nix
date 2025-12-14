{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # File picking
    ripgrep
    fd
    fzf

    # Language servers
    lua-language-server
    nixpkgs-fmt
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
}
