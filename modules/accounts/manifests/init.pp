# This class configures the resources common to _all_ accounts.

class accounts {

  file { '/home':
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => 0755,
  }

}

