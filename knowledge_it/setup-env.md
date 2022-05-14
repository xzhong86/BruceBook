# Setup Environment

## Setup Web server

On Fedora:
  * Official web page: [Getting started with Apache HTTP Server](https://docs.fedoraproject.org/en-US/quick-docs/getting-started-with-apache-http-server/)
  * install apache server: `sudo dnf install httpd`
  * start service now: `sudo systemctl start httpd`
  * enable service at boot: `sudo systemctl enable httpd`
  * You need to open firewall port:
    * enable port after reboot: `sudo firewall-cmd --permanent --add-service=http`
    * enable port now: `sudo firewall-cmd --add-service=http`



