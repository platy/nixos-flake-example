# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, self, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCs1JZA0pHL1mxLCft4XgQHSvcx3aPTsR2HbRWbh0bEWELX/o2AbM0SdZSku+9SQhAALoeWFSgsptiTa3KPhCyYQRA/Q2UfCsoFXn5Nfr6OFWR2LnP5t6q9cJM2WkFdXr00lENmy6XWuBhxTBB6AQ5am6+B2jmhSMEuHyWH87fLg1tWtpxRuxPMmwyQCGtNSGk3NJQ3KdlKQqqtMSrOD/yuK60IvTZGaMF5IQkVJVqqHaa1DMzbwq8++OuG2jYg7V8S3z1nz/RCLr9mfEKZipTkrJctJYR414FdIQs45JaKpuieGAfsP8B9yT7DS6eZsyadj1VtvqsJNs7W7RQ/iWIgiuBt0UvBINGRkN18wK3PN86iI5lCjzBTOZIemLvkjbeAfuiPKNse4JyWf2DReV22LS0W05XL392Bm4Sp/7G26lGUpenFO511ExdEGKxBYurLJGBFLgGuTXTlOBcGd9a3G8Ho8oAW8SDdZ0bccG2dTdvhXAdragx3UN5sHF4Sx5p3698iyYRIEA7HT1sboajWkC0ievGWkuWJAAifHOpEqmLWia5KeWuq3dsN6Q/r2ID0uNKs/DhOgucmKBjR1jDduZtVrQWA6sATN/l8sa5gcN5/L5Hfx87Kkz3Q1l7BaPskE7jwuoPBaSHD/kJEYbrWSHqGZdOw9o1oJYPJ02aNQQ== Marney" 
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGoIIauYvOlIaARfMwBaEUCraTfuLt38bRtstrt9m4gY Volta" 
  ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  boot.cleanTmpDir = true;
  zramSwap.enable = true;

  # Let 'nixos-version --json' know about the Git revision
  # of this flake.
  system.configurationRevision = pkgs.lib.mkIf (self ? rev) self.rev;

  # Network configuration.
  # networking.useDHCP = false;
  networking.firewall.allowedTCPPorts = [ 80 ];
  networking.hostName = "n1";

  # Enable a web server.
  services.httpd = {
    enable = true;
    adminAddr = "morty@example.org";
  };

  services.openssh.enable = true;
}
