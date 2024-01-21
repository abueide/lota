{
  description = "Cliffy - the helpful nix vm management tool";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url  = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, rust-overlay, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
        rust-toolchain = (pkgs.rust-bin.beta.latest.default.override { extensions = [ "rust-src" ]; });
        cliffyPackage = pkgs.stdenv.mkDerivation {
          name = "cliffy";
          src = self;
          buildInputs = [ pkgs.cargo pkgs.rustc ];
          buildPhase = ''
            cargo build --release
          '';
          installPhase = ''
            install -D target/release/cliffy $out/bin/cliffy
          '';
        };

        apps.cliffy = {
          type = "app";
          program = "${cliffyPackage}/bin/cliffy";
        };
      in
      with pkgs;
      {
        devShells.default = mkShell {
          buildInputs = [
            openssl
            pkg-config
            eza
            fd
            jetbrains.rust-rover
            rust-toolchain
          ];

          shellHook = ''
            alias ls=eza
            alias find=fd
            export RUST_SRC_PATH="${rust-toolchain}/lib/rustlib/src/rust/library"
          '';
        };
      defaultPackage = cliffyPackage;
      defaultApp = apps.cliffy;
    }
    );
}