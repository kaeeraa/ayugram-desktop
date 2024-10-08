{
  description = "AyuGram Desktop";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  nixConfig = {
    extra-substituters = [ "https://cache.garnix.io" ];
    extra-trusted-public-keys = [ "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=" ];
  };

    outputs = {self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      {
        packages = rec {
          ayugram-desktop = (nixpkgs.legacyPackages.${system}.libsForQt5.callPackage ./default.nix { });
          default = ayugram-desktop;
        };
      }
    );
}

