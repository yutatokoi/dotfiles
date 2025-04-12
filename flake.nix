{
  description = "yutatokoi's nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ pkgs.certbot
          pkgs.docker
          pkgs.fastfetch
          pkgs.ffmpeg
          pkgs.fish
          pkgs.gh
          pkgs.gnupg
          pkgs.htop
          pkgs.neovim
          pkgs.newsboat
          pkgs.python313
          pkgs.ripgrep
          pkgs.starship
          pkgs.texliveFull
          pkgs.trivy
          pkgs.wget
          pkgs.yt-dlp
        ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      programs.zsh.enable = true;
      programs.fish.enable = true;

      # Set fish as the default shell
      users.knownUsers = [ "yutatokoi" ];
      users.users.yutatokoi.uid = 501;
      users.users.yutatokoi.shell = pkgs.fish;

      # Configure macOS settings
      system.defaults = {
        NSGlobalDomain.AppleICUForce24HourTime = true;
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        NSGlobalDomain.AppleMeasurementUnits = "Centimeters";
        NSGlobalDomain.AppleMetricUnits = 0;
        NSGlobalDomain.ApplePressAndHoldEnabled = false;
        NSGlobalDomain.AppleScrollerPagingBehavior = true;
        NSGlobalDomain.AppleShowAllExtensions = true;
        NSGlobalDomain.AppleShowAllFiles = true;
        NSGlobalDomain.AppleShowScrollBars = "WhenScrolling";
        NSGlobalDomain.AppleTemperatureUnit = "Celsius";
        NSGlobalDomain.InitialKeyRepeat = 15;
        NSGlobalDomain.KeyRepeat = 2;
        NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
        NSGlobalDomain.NSAutomaticDashSubstitutionEnabled = false;
        NSGlobalDomain.NSAutomaticInlinePredictionEnabled = false;
        NSGlobalDomain.NSAutomaticPeriodSubstitutionEnabled = false;
        NSGlobalDomain.NSAutomaticQuoteSubstitutionEnabled = false;
        NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;
        NSGlobalDomain.NSAutomaticWindowAnimationsEnabled = false;
        NSGlobalDomain.NSDocumentSaveNewDocumentsToCloud = false;
        NSGlobalDomain."com.apple.trackpad.forceClick" = false;
        NSGlobalDomain."com.apple.trackpad.scaling" = 2.0;
        SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;
        WindowManager.GloballyEnabled = false;
        controlcenter.Bluetooth = true;
        controlcenter.Display = false;
        controlcenter.FocusModes = false;
        controlcenter.NowPlaying = false;
        controlcenter.Sound = true;
        dock.autohide = true;
        dock.autohide-delay = 0.0;
        dock.launchanim = false;
        dock.mineffect = "scale";
        dock.orientation = "right";
        dock.show-recents = false;
        dock.static-only = true;
        dock.tilesize = 64;
        dock.wvous-bl-corner = 1;
        dock.wvous-br-corner = 1;
        dock.wvous-tl-corner = 1;
        dock.wvous-tr-corner = 1;
        finder.AppleShowAllExtensions = true; 
        finder.AppleShowAllFiles = true;
        finder.FXPreferredViewStyle = "clmv";
        finder.NewWindowTarget = "Documents";
        finder.ShowPathbar = true;
        finder.ShowStatusBar = true;
        finder._FXShowPosixPathInTitle = true;
        menuExtraClock.Show24Hour = true;
        trackpad.FirstClickThreshold = 0;
        trackpad.SecondClickThreshold = 0;
        trackpad.TrackpadThreeFingerTapGesture = 0;
      };
      system = {
        keyboard.enableKeyMapping = true;
        keyboard.remapCapsLockToEscape = true;
      };

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Yutas-MacBook-Pro
    darwinConfigurations."Yutas-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
