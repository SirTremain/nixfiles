{ config, pkgs, ... }:

{
  # Enable font configuration
  fonts.fontconfig.enable = true;
  
  # Custom Iosevka fonts
  home.file.".local/share/fonts/iosevka-custom" = {
    source = ../fonts;
    recursive = true;
  };
  
  home.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.hack
    nerd-fonts.caskaydia-cove
  ];
}