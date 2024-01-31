{
  description = "Legends of the Abyss";

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
        enginePkgs = pkgs.rustBuilder.makePackageSet {
          rustVersion = "latest";
          rustChannel = "beta";
          packageFun = import ./engine/Cargo.nix;
        };
        quadPkgs = pkgs.rustBuilder.makePackageSet {
          rustVersion = "latest";
          rustChannel = "beta";
          packageFun = import ./quad/Cargo.nix;
        };
      in rec
      {
        devShells.default = enginePkgs.workspaceShell {
          packages = [ 
            pkgs.jetbrains.rust-rover 
            cargo2nix.outputs.packages."${system}".cargo2nix
          ];

          LD_LIBRARY_PATH = builtins.concatStringsSep ":" [
            "${pkgs.xorg.libX11}/lib"
            "${pkgs.xorg.libXi}/lib"
            "${pkgs.libGL}/lib"
          ];
        };
        packages = {
          engine = (enginePkgs.workspace.engine {});
          quad = (quadPkgs.workspace.quad {});
          default = packages.quad;
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