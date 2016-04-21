node default {
  notify {'Provisioning Docker Cabal':}

  package { "wget": }
  user { 'cabal':
    ensure => present,
    home   => '/home/cabal',
    managehome => true,
  }

  class { 'ghc::install': }
  class { 'cabal::install': }
}
