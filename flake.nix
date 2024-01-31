{
  description = "Cliffy - the helpful nix vm management tool";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url  = "github:numtide/flake-utils";
    cargo2nix.url    = "github:cargo2nix/cargo2nix/release-0.11.0";
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
        devShells.default = rustPkgs.workspaceShell {
          packages = [ 
            pkgs.jetbrains.rust-rover 
            cargo2nix.outputs.packages."${system}".cargo2nix
            ];
        };
        packages = {
          cliffy = (rustPkgs.workspace.cliffy {});
          default = packages.cliffy;
        };
        apps.repl = flake-utils.lib.mkApp {
          drv = pkgs.writeShellScriptBin "repl" ''
            confnix=$(mktemp)
            echo "builtins.getFlake (toString $(git rev-parse --show-toplevel))" >$confnix
            trap "rm $confnix" EXIT
            nix repl $confnix
          '';
        };
    }
  );
}