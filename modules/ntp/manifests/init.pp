# Class: ntp
#
#   THis is the ntp class
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class ntp($server='pool.ntp.org') {

  package { 'ntp':
    ensure => present,
    notify => Service['ntp'],
    before => File['ntp.conf'],
  }
  # Custom Facts are always strings, never booleans.  =(
  if ($fact_allow_adhoc_changes == 'true') {
    file { 'ntp.conf':
      path => '/etc/ntp.conf',
    }
  } else {
    file { 'ntp.conf':
      path    => '/etc/ntp.conf',
      content => template("${module_name}/ntp.conf"),
    }
  }

  service { 'ntp':
    ensure     => running,
    name       => ntpd,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    subscribe  => File['ntp.conf'],
  }

}
