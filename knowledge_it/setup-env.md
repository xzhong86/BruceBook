# Setup Environment

## Setup Web server

On Fedora 36:
  * Official web page: [Getting started with Apache HTTP Server](https://docs.fedoraproject.org/en-US/quick-docs/getting-started-with-apache-http-server/)
  * install apache server: `sudo dnf install httpd`
  * start service now: `sudo systemctl start httpd`
  * enable service at boot: `sudo systemctl enable httpd`
  * You need to open firewall port:
    * enable port after reboot: `sudo firewall-cmd --permanent --add-service=http`
    * enable port now: `sudo firewall-cmd --add-service=http`


## Setup Squid proxy

On Ubuntu 20.04:
  * install squid with `sudo apt install squid`
  * edit /etc/squid/squid.conf to add remote IP into localnet, uncomment "http\_access allow localnet".
    * 我因为没有注释这个地方导致没法访问代理，错误为 TCD\_DENIDE
  * restart service `sudo systemctl restart squid`
  * enable port in firewall.
    * 我使用的腾讯云，默认关闭防火墙，但是外部有防火墙，需要从腾讯云控制台添加端口。

