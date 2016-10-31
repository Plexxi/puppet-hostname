# == Class: hostname
#
# A class for persistent changing of system hostname.
# Dependent on Plexxi 'px-hostname' tool.
#
# === Copyright
#
# Copyright 2016 Plexxi, Inc.
#
class hostname (
  $hostname = 'plexxi',
) {

  validate_re($hostname, '^(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])$')
  #validate_re($hostname, '^(([a-zA-Z]|[a-zA-Z][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z]|[A-Za-z][A-Za-z0-9\-]*[A-Za-z0-9])$')

  package { 'px-utils':
    ensure => 'installed',
  }

  exec { 'engage':
    command => "/usr/bin/px-hostname -y ${hostname}",
    onlyif => "/usr/bin/test `/bin/cat /etc/hostname` != ${hostname}",
  }
}
