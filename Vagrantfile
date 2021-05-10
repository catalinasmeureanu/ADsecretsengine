$domain = "hashicorp.com" # Set example domain
$domain_ip_address = "192.168.56.2"
$timezone = "W. Europe Standard Time" # Amsterdam local time 

Vagrant.configure("2") do |config|

    config.vm.box = "StefanScherer/windows_2016"
    config.vm.define "windows-domain-controller"
    config.vm.hostname = "WinDC"

    #WinRM settings
    config.winrm.transport = :plaintext
    config.winrm.basic_auth_only = true
    config.vm.guest = :windows
    config.vm.communicator = "winrm"
    config.winrm.username  = "vagrant"
    config.winrm.password  = "vagrant"

    config.vm.network :private_network, ip: $domain_ip_address


    config.vm.network "forwarded_port", host: 33389, guest: 3389 #RDP
    config.vm.network "forwarded_port", host: 10389, guest: 389 #LDAP
    config.vm.network "forwarded_port", host: 10636, guest: 636 #LDAPS

        # Configure VirtualBox
        config.vm.provider :virtualbox do |v|
            v.gui = true
            v.name = "WinDC"
            v.cpus = 2
            v.memory = 2048
            v.linked_clone = true
            v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
        end    

    config.vm.synced_folder ".", "/vagrant"

    # Installing AD DS
    config.vm.provision "shell", path: "provision/domain-controller.ps1", args: [$domain]
    config.vm.provision "shell", reboot: true
    config.vm.provision "shell", path: "provision/domain-controller-configure.ps1"
    config.vm.provision "shell", reboot: true
    config.vm.provision "shell", path: "provision/base.ps1", args: [$timezone]


end
