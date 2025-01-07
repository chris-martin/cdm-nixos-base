{
  description = "NixOS modules for Chris's machines";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
  };

  outputs = { self, nixpkgs }: {
    nixosModules.x86_64-linux.authorized-keys = import ./modules/authorized-keys.nix;
  };
}
