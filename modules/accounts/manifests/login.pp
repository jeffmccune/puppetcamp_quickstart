# Define: accounts::login
#
#   This defined resource type manages a login account.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
#   accounts::login { 'jeff':
#     password => '',
#     uid      => '1024',
#     gid      => '1024',
#   }
#
define accounts::login($uid='UNSET', $gid='UNSET', $password='UNSET') {

  if ($uid == 'UNSET') {
    $uid_real = undef
  } else {
    $uid_real = $uid
  }

  if ($gid == 'UNSET') {
    $gid_real = undef
  } else {
    $gid_real = $gid
  }

  if ($password == 'UNSET') {
    $password_real = undef
  } else {
    $password_real = $password
  }

  if $name == "root" {
    $home_real = '/root'
  } else {
    $home_real = "/home/$name"
  }

  # statements

  user { $name:
    ensure   => present,
    uid      => $uid_real,
    gid      => $gid_real,
    home     => $home_real,
    comment  => "$name",
    password => $password_real,
  }
  
  group { $name:
    ensure => present,
    gid    => $gid_real,
  }

  file { $home_real:
    ensure       => directory,
    owner        => $name,
    group        => $name,
    mode         => '0640',
    recurse      => true,
    recurselimit => 1,
    ignore       => [ ".git", 'src' ],
    source       => "puppet:///modules/${module_name}_data/${name}"
  }

}
# EOF
