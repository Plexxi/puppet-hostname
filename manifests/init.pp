# == Class: hostname
#
# A class for persistent changing of system hostname.
# Dependent on Plexxi 'px-hostname' tool.
#
# === Copyright
#
# Copyright 2018 Plexxi, Inc.
#
class hostname (
  Pattern[/\A(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])\Z/] $hostname = 'plexxi',
) {

  package { 'px-utils':
    ensure => 'installed',
  }

  exec { 'engage':
    command => "/usr/bin/px-hostname -y ${hostname}",
    onlyif => "/usr/bin/test `/bin/cat /etc/hostname` != ${hostname}",
  }
}
