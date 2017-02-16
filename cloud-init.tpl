#cloud-config
preserve_hostname: true
manage-resolv-conf: false
manage_etc_hosts: false
timezone: UTC

bootcmd:
  - [cloud-init-per, once, set_hostname_file, /bin/sh, -xc, 'echo "$(curl http://169.254.169.254/latest/meta-data/instance-id)" > /etc/hostname']
  - [cloud-init-per, once, set_mailname_file, /bin/sh, -xc, 'echo "$(curl
    http://169.254.169.254/latest/meta-data/instance-id).${domain_net}" > /etc/mailname']
  - [cloud-init-per, once, set_hosts_file, /bin/sh, -xc, 'echo "$(curl
  http://169.254.169.254/latest/meta-data/local-ipv4)" "$(curl
  http://169.254.169.254/latest/meta-data/instance-id).${domain_net}" "
$(curl http://169.254.169.254/latest/meta-data/instance-id)" >> /etc/hosts']
  - cloud-init-per once set_hostname hostname $(curl http://169.254.169.254/latest/meta-data/instance-id)
  - cloud-init-per once restart_rsyslog /usr/sbin/service rsyslog restart


