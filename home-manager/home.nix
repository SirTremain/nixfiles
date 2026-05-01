{ config, lib, pkgs, ... }:

{
  home.username = "tremain";
  home.homeDirectory = "/home/tremain";

  

  
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.nvidia.acceptLicense = true;
  #config.nix.allowUnfree = true;
  #config.nix.nvidia.acceptLicence = true;

  nixpkgs.overlays = [
    (final: prev: {
      pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
        (python-final: python-prev: {
          picosvg = python-prev.picosvg.overridePythonAttrs (oldAttrs: {
            doCheck = false;
          });
        })
      ];
    })
  ];
  
  targets.genericLinux.gpu = {
    enable = true;
    nvidia = {
      enable  = true;
      version = "595.71.05";
      sha256 = "sha256-NiA7iWC35JyKQva6H1hjzeNKBek9KyS3mK8G3YRva4I=";
    };
  };
  # nix flake update
  # nix-channel --update
  # nvidia-smi
  # nix store prefetch-file https://download.nvidia.com/XFree86/Linux-x86_64/595.71.05/NVIDIA-Linux-x86_64-595.71.05.run

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

