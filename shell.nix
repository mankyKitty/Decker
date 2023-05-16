{ srcs ? import ./nix/sources.nix }:
let
  pkgs = import srcs.nixpkgs {};
  drv = pkgs.callPackage ./default.nix {};
in
pkgs.mkShell {
  buildInputs = [
    drv
  ];
}
