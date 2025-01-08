{
  description = "NixOS modules for Chris's machines";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    editor-cdm.url = "github:chris-martin/editor-cdm";
  };

  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosModules.x86_64-linux = {
      authorized-keys = import ./modules/authorized-keys.nix;
      essentials = import ./modules/essentials.nix;
      extra = import ./modules/extra.nix;
      fonts = import ./modules/fonts.nix;
      home = {
        imports = [
          inputs.home-manager.nixosModule
          {
            home-manager.users.chris.imports = [
              (import ./modules/home {
                pkgs = nixpkgs.legacyPackages.x86_64-linux;
                editor = "${inputs.editor-cdm.packages.x86_64-linux.editor-cdm}/bin/editor-cdm";
              })
            ];
          }
        ];
      };
      location = import ./modules/location.nix;
      networking = import ./modules/networking.nix;
      nix = import ./modules/nix.nix;
      printing = import ./modules/printing.nix;
    };
  };
}
