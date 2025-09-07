{ config, pkgs, ... }:

{
  home.username = "tremain";
  home.homeDirectory = "/home/tremain";

  home.packages = [
    pkgs.bat
  ];

  programs.bat = {
    enable = true;
    config = {
      theme = "TwoDark";
      style = "numbers,changes";
    };
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

