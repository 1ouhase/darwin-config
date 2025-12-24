 let
    configuration = { pkgs, config, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget

      nixpkgs.config.allowUnfree = true;	

      environment.systemPackages =
        [ 
		pkgs.vim
		pkgs.mkalias
		pkgs.vscode
		pkgs.firefox
		#pkgs.spotify
		pkgs.discord
		pkgs.zip
		pkgs.unzip
        ];

      homebrew = {
	enable = true;

	brews = [
	  "mas"
	];

	casks = [
	  "spotify"
	  "prismlauncher"
	];

	masApps = {
	  #"Yoink" = 457622435;
	};

	onActivation.cleanup = "zap";
	onActivation.autoUpdate = true;
	onActivation.upgrade = true;
      };

      system.primaryUser = "iouhase";
      system.defaults = {
	dock.autohide = true;
	dock.enable-spring-load-actions-on-all-items = true;
	dock.minimize-to-application = true;
	dock.persistent-apps = [
	{
	 app = "/System//Applications/Mail.app";
	}	
 	{
   	 app = "/Applications/Nix Apps/Firefox.app";
 	}
	{
	 app = "/Applications/nix apps/discord.app";
	}
	{
	 app = "/Applications/Spotify.app";
	}	
	{
	 app = "/System/Applications/Utilities/Console.app";
	}	
	];
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    }
in