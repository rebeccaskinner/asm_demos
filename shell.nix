{ pkgs ? import <nixpkgs> {} }:

with pkgs;

mkShell {
buildInputs = [ gcc nasm binutils ghc ];
}
