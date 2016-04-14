node default {
  notify {'Provisioning Docker Cabal':}

  package { "wget": }
  class { 'ghc::install': }
  class { 'cabal::install': }
}
