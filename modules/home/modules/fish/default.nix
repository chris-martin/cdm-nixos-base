{ pkgs, editor }:
{
  imports = [
    (import ./git.nix { inherit editor; })
    ./nix.nix
    ./oseary.nix
  ];

  programs.fish = {
    enable = true;
    package = pkgs.fish;
    interactiveShellInit = ''
      set fish_greeting
      set --export EDITOR ${editor}
    '';
    shellInit = ''
      set fish_user_paths /home/chris/bin /home/chris/.cabal/bin /home/chris/.local/bin /home/chris/.nix-profile/bin
    '';
    shellAbbrs = {
      restart = "sudo systemctl restart";
      start = "sudo systemctl start";
      stop = "sudo systemctl stop";
      trash = "gio trash";
      clip = "xclip -selection clipboard";
    };
    shellAliases = {
      e = editor;
      ls = "ls --color --group-directories-first";
    };
    functions = {
      hsnix = {
        argumentNames = "pkg";
        body = ''
          cabal2nix "cabal://$pkg" > "$pkg.nix"
        '';
      };
    };
  };
}
