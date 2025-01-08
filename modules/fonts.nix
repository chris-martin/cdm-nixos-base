{ pkgs, ... }:
{
  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fonts = [
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
    (pkgs.google-fonts.override { fonts = [ "BioRhyme" ]; })
    (pkgs.google-fonts.override { fonts = [ "Bitter" ]; })
    (pkgs.google-fonts.override { fonts = [ "Overlock SC" ]; })
    (pkgs.google-fonts.override { fonts = [ "Redacted Script" ]; })
    pkgs.hasklig
    pkgs.helvetica-neue-lt-std
    pkgs.inconsolata
    pkgs.luculent
    pkgs.profont
    pkgs.source-sans-pro
    pkgs.source-serif-pro
    pkgs.symbola
    pkgs.ubuntu_font_family
    pkgs.unifont
    pkgs.vistafonts
  ];
}
