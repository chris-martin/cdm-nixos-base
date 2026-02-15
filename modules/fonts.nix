{ pkgs, ... }:
{
  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    packages = [
      pkgs.corefonts
      pkgs.fira-mono
    ];
  };

  environment.systemPackages = [
    pkgs.corefonts
    pkgs.fira
    pkgs.fira-code
    pkgs.fira-mono
    pkgs.lato
    pkgs.merriweather
    pkgs.monoid
    pkgs.hasklig
    pkgs.helvetica-neue-lt-std
    pkgs.inconsolata
    pkgs.luculent
    pkgs.profont
    pkgs.source-sans-pro
    pkgs.source-serif-pro
    pkgs.ubuntu-classic
    pkgs.unifont
    pkgs.vista-fonts
  ];
}
