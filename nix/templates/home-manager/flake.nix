{
  description = "Home-manager configuration with Hermes Agent";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hermes-agent = {
      url = "github:NousResearch/hermes-agent";
      # If using a local checkout instead:
      # url = "path:/path/to/hermes-agent";
    };
  };

  outputs = { nixpkgs, home-manager, hermes-agent, ... }: {
    homeConfigurations."USERNAME" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      # For Apple Silicon: nixpkgs.legacyPackages.aarch64-darwin
      modules = [
        hermes-agent.homeManagerModules.default
        ./home.nix
      ];
    };
  };
}
