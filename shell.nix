{
  pkgs ? import (builtins.fetchGit {
    url = "https://github.com/NixOS/nixpkgs/";
    ref = "nixos-23.05";
    rev = "4ecab3273592f27479a583fb6d975d4aba3486fe";
  }) {}
}:
let py310 = pkgs.python310;
in
pkgs.mkShell {
  name = "tracebot-env";
  buildInputs = with pkgs; [
    poetry
    python310
    python311
  ];
  shellHook = ''
    poetry env use "${py310}/bin/python"
    poetry install --sync
    source "$(poetry env info --path)/bin/activate"
  '';
}
