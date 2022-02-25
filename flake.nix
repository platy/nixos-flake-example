
{
  description = "An example NixOS configuration";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";

  outputs = {self, nixpkgs, ...}@inputs:
  {
    nixosConfigurations = {

      n1 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ({pkgs, ... }: {

            # Let 'nixos-version --json' know about the Git revision
            # of this flake.
            system.configurationRevision = pkgs.lib.mkIf (self ? rev) self.rev;
          })
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}

