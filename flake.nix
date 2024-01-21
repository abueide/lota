{
  description = "Cliffy - the helpful nix vm management tool";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url  = "github:numtide/flake-utils";
    cargo2nix.url = "github:cargo2nix/cargo2nix/release-0.11.0";
  };

  outputs = inputs: with inputs;
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [
          cargo2nix.overlays.default
        ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
        rustPkgs = pkgs.rustBuilder.makePackageSet {
          rustVersion = "latest";
          rustChannel = "beta";
          packageFun = import ./Cargo.nix;
        };
      in rec
      {
        devShells.default = mkShell {
          buildInputs = [
            openssl
            pkg-config
            eza
            fd
            jetbrains.rust-rover
            rustPkgs
          ];

          shellHook = ''
            alias ls=eza
            alias find=fd
            export RUST_SRC_PATH="${rustPkgs}/lib/rustlib/src/rust/library"
          '';
        };
        packages = {
          cliffy = (rustPkgs.workspace.cliffy {});
          default = packages.cliffy;
        };
    }
  );
}