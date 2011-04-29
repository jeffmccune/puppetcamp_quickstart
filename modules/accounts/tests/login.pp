# This is an example of how to use the accounts::login defined
# resource type.  The structure of tests/ matches the structure of manifests/

node default {

  include accounts

  accounts::login { 'root':
    uid => '0',
    gid => '0',
  }
  accounts::login { 'jeff':
    uid => '1024',
    gid => '1024',
  }
  accounts::login { 'jose':
    uid => '1025',
    gid => '1025',
  }

}
