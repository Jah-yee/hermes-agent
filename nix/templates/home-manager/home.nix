{ config, pkgs, ... }: {
  # TODO: Change these to match your system
  home.username = "USERNAME";
  home.homeDirectory = "/home/USERNAME";
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  services.hermes-agent = {
    enable = true;
    gateway.enable = true;
    # environmentFile = "~/.hermes/.env";  # default
    # messagingCwd = "~";                  # default
    # stateDir = "~/.hermes-agent";        # default
    # addToPATH = true;                    # default
  };
}
