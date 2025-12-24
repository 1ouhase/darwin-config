{ pkgs, config, ... }: {
  # Nixpkgs configuration
  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";

  # System packages
  environment.systemPackages = [
    pkgs.vim
    pkgs.mkalias
    pkgs.vscode
    pkgs.firefox
    pkgs.discord
    pkgs.zip
    pkgs.unzip
    pkgs.neofetch
  ];

  # Homebrew configuration
  homebrew = {
    enable = true;

    brews = [
      "mas"
      "node"
      "mongodb-atlas"
    ];

    casks = [
      "spotify"
      "prismlauncher"
      "steam"
      "mongodb-compass"
    ];

    masApps = {
      # Uncomment and add as needed
      # "Yoink" = 457622435;
    };

    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };

  # User and system defaults
  system = {
    primaryUser = "iouhase";
    configurationRevision = null;
    stateVersion = 6;

    defaults = {
      dock = {
        autohide = true;
        enable-spring-load-actions-on-all-items = true;
        minimize-to-application = true;
        show-recents = true;
        showhidden = true;
        show-process-indicators = false;
        
        persistent-apps = [
          { app = "/System//Applications/Mail.app"; }
          { app = "/Applications/Nix Apps/Firefox.app"; }
          { app = "/Applications/nix apps/discord.app"; }
          { app = "/Applications/Spotify.app"; }
          { app = "/System/Applications/Utilities/Terminal.app"; }
        ];
      };
    };
  };

  # Nix settings
  nix.settings.experimental-features = "nix-command flakes";

  # Shell configuration
  programs = {
    fish = {
      enable = true;
      shellAbbrs = {
        nrb = "sudo darwin-rebuild switch --flake /etc/nix-darwin#laptop";
      };
    };
  };

  environment.shells = [ pkgs.fish ];
}
