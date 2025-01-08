{

  networking.firewall.allowPing = true;

  services.avahi = {
    enable = true;
    nssmdns = true;
    publish = {
      enable = true;
      addresses = true;
    };
  };

  networking.nameservers = [ "1.1.1.1" "8.8.8.8" "8.8.4.4" ];

}