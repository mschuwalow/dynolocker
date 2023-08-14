{

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-20.09";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:

    flake-utils.lib.simpleFlake {
      inherit self nixpkgs;

      name = "dynolocker";

      shell = { pkgs }:
        with pkgs;

        mkShell {
          buildInputs = [
            glide
            gnumake
            go
          ];
        };

      systems = [ "x86_64-linux" "x86_64-darwin" ];
    };
}
