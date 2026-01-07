{ config, lib, pkgs, ... }:

{
  home.username = "tremain";
  home.homeDirectory = "/home/tremain";
  
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.nvidia.acceptLicense = true;
  #config.nix.allowUnfree = true;
  #config.nix.nvidia.acceptLicence = true;
  
  targets.genericLinux.gpu = {
    enable = true;
    nvidia = {
      enable  = true;
      version = "590.48.01";
      sha256 = "sha256-ueL4BpN4FDHMh/TNKRCeEz3Oy1ClDWto1LO/LWlr1ok=";
    };
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  imports = [
    ./programs/bat.nix
    ./programs/vscode.nix
    ./programs/fonts.nix
    ./programs/kitty.nix
    ./programs/starship.nix
  ];

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

