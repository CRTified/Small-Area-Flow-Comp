{
  inputs.nixpkgs.url = "nixpkgs";
  outputs = { self, nixpkgs }:
    let
      forAllSystems = function:
        nixpkgs.lib.genAttrs [
          "x86_64-linux"
          "aarch64-linux"
          "aarch64-darwin"
          "x86_64-darwin"
          "armv7l-linux"
        ] (system: function nixpkgs.legacyPackages.${system});

    in {

      packages = forAllSystems (pkgs: rec {
        default = pkgs.callPackage ./package.nix { };
        small_area_flow_comp = default;
      });
    };
}
