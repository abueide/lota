{
  description = "A Rust CLI tool - cliffy";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, flake-utils, rust-overlay }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ rust-overlay.overlay ];
        };
        rustEnv = pkgs.mkShell {
          buildInputs = with pkgs; [
            pkgs.rust-bin.stable.latest.default
            pkgs.rustfmt
            pkgs.cargo
            pkgs.openssl
            pkgs.pkgconfig
          ];

          RUST_SRC_PATH = "${pkgs.rust-src}";
        };
      in
      {
        devShell = rustEnv;

        packages.default = pkgs.stdenv.mkDerivation {
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
      }
    );
}
