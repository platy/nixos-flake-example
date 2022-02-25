
{
  description = "An example NixOS configuration";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";

  outputs = inputs:
  {
    nixosConfigurations = {

      n1 = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}

