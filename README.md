Puppet Nginx Proxy Module
Welcome to my custom NGINX Proxy module.

Description
This custom puppet module allows to automate the installation of a Proxy using Nginx libraries on remote nodes and perform the actions described below.

Initialize the custom class created for the module and wraps all puppet files.

This configuration is defined in the init.pp file.

Installs Nginx packages, makes sure that service daemon is up and running and configures SSL certificates on the server.

This configuration is defined in the server_install.pp file.

Create a proxy to redirect requests for https://domain.com to 10.10.10.10 and redirect requests for https://domain.com/resoure2 to 20.20.20.20.

This configuration can be found in the proxy_config.pp file. It is composed of two subclasses, the first one configures requests sent to https://domain.com to be diverted to IP 10.10.10.10. On the other hand, the second subclass configures the proxy to divert requests made to https://domain.com/resource2 to IP 20.20.20.20.

Create a forward proxy to log HTTP requests going from the internal network to the Internet including: request protocol, remote IP and time take to serve the request.

This configuration can be found in the proxy_log.pp file. It is composed of one subclass. It allows to forwarding internal HTTPS requests and be resolve by an internet DNS 8.8.8.8 and login custom requests in a specific format.

Implements a health check on the proxy to see the current working state of the server/s.

This configuration can be found in the proxy_health.pp file. It is composed of one subclass. This allows to send health packets to upstream servers or single server to monitor its current status. The port specified for these packets is 8080.

Perform configuration on remote hosts.

This configuration can be found in the site.pp file. It is composed of one subclass. This allows to apply the custom class created for the module with all its configuration to all hosts"default". However this could be changed to point to the desired server.

Download the module
As this module is not located in Pupper Forge, we have to download it into our system to install it locally. To do this we have to do the following:

Go to the green button named "Code" in this webpage and right click it and copy the URL.

Go to your desired Linux CLI/Terminal and type git clone and paste the previous URL copied. git clone https://github.com/peli23/customnproxy.git or git clone https://github.com/peli23/customproxy.git "Whateverfolderyouwanttocopyit"

Setup
Now it is the time to setup our puppet module.

In order to install it we need to run the following command:

puppet module install peli23-customproxy-0.1.0.tar.gz --ignore-dependencies

To see if the installation was successful we run this command:

puppet module list

Running the command above we should see that our module has been installed in the module local directory defined in /etc/puppetlabs/puppet/puppet.conf. This path might change depending on your Linux Distro and your puppet configuration settings.

root@puppetmaster:~/puppet/customproxy/manifests# puppet module list /etc/puppetlabs/code/environments/production/modules ├── peli23-customproxy (v0.1.0) ├── puppet-nginx (v3.0.0) ├── puppetlabs-concat (v6.4.0) ├── puppetlabs-stdlib (v6.6.0) └── puppetlabs-translate (v2.2.0) /etc/puppetlabs/code/modules (no modules installed) /opt/puppetlabs/puppet/modules (no modules installed)

Testing the module.
Once the module is installed, we have to check that the module is working ok. To verify we need to enter the command described below. This command does not apply the configuration on the remote node, it just performs a dry run locally.

We need to navigate to the module folder and enter into the manifests directory, then we run the following with the --noop option that indicates that no configuration will be applied to the remote host.

puppet apply peli23-customproxy/manifests/init.pp --noop

Note: Please ensure puppetserver service is running on the server and puppet agent service is running on the remote node and both do know each other and SSL certificates has been shared.

Execute the module
To execute the module on the remote hosts and perform the configuration use the same command mentioned in the previous step but without --noop flag.

puppet apply peli23-customproxy/manifests/init.pp