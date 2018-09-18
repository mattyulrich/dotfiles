# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "mattynix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # enables network manager

#  networking.wireless.networks = {
#	"SugarBaby AC" = {
#		psk = "whatwhat";
#	};
#  };

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  # environment.systemPackages = with pkgs; [
  #   wget
  # ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";


   services.xserver = {
	enable = true;
	layout = "us";
	xkbOptions = "eurosign:e";
	windowManager.xmonad = {
		enable = true;
		enableContribAndExtras = true;
		extraPackages = haskellPackages: [
			haskellPackages.xmonad-contrib
			haskellPackages.xmonad-extras
			haskellPackages.xmonad
		];
	};
	windowManager.default = "xmonad";
	# displayManager.sessionCommands = with pkgs; lib.mkAfter
	# 	''
	# 	xmodmap /th/to/.Xmodmap
	# 	'';
   };

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Problems with the mouse
  services.xserver.synaptics.enable = true;

  # Media Keys for Volume
  sound.mediaKeys = {
	enable = true;
	volumeStep = "5%";
  };

  hardware = {
	pulseaudio.enable = true;
	pulseaudio.support32Bit = true;
  };

  hardware.bluetooth.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.extraUsers.matty = {
	name = "matty";
	description = "Matty U!";
	group = "users";
	extraGroups = [ "wheel" "lp" ];  # Enable SUDO
	uid = 1000;
	createHome = true;
	home = "/home/matty";
	shell = "/run/current-system/sw/bin/bash";
   };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";

}
