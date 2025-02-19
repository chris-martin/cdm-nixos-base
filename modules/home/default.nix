{ pkgs, editor, ... }: {
  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "22.11";

  imports = [
    ./generic

    (import ./modules/fish { inherit pkgs editor; })
    ./modules/git
    ./modules/tmux.nix
    ./modules/xdg.nix
  ];

  fonts.fontconfig.enable = true;

  programs.cabal = {
    enable = true;
    installDirectory = "/home/chris/.cabal/bin";
    username = "chris_martin";
    passwordCommand = "${pkgs.writeShellScript "print-hackage-password" ''
      ${pkgs.pass}/bin/pass show computer/haskell/hackage | ${pkgs.coreutils}/bin/head -n1
    ''}";
  };

  programs.ghci = {
    enable = true;
    prompt = "\\n\\ESC[1;35m\\x03BB> \\ESC[m";
    promptContinue = "\\ESC[1;35m > \\ESC[m";
    multiline = true;
  };

  programs.home-manager.enable = true;

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "*".identityFile = "/home/chris/.ssh/default-key";
    };
  };

}
