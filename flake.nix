{
  description = "NixOS modules for Chris's machines";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
  };

  outputs = { self, nixpkgs }: {
    nixosModules.x86_64-linux = {
      authorized-keys = import ./modules/authorized-keys.nix;
      essentials = import ./modules/essentials.nix;
      extra = import ./modules/extra.nix;
      fonts = import ./modules/fonts.nix;
      location = import ./modules/location.nix;
      networking = import ./modules/networking.nix;
      nix = import ./modules/nix.nix;
      printing = import ./modules/printing.nix;
    };
  };
}
