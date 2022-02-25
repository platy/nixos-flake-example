{ modulesPath, ... }:
{
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];
  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
    device = "nodev";
  };
  boot.initrd.kernelModules = [ "nvme" ];
  fileSystems."/boot" = { device = "/dev/disk/by-uuid/591D-B8EA"; fsType = "vfat"; }; # TODO need to get rid of this UUID, maybe replace both with labels
  fileSystems."/" = { device = "/dev/vda1"; fsType = "ext4"; };
}
