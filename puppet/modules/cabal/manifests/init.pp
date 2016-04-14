# Install cabal.

class cabal::install () {
  require ghc::install

  user { 'cabal':
    ensure => present,
    home   => '/home/cabal',
  }

  # Make sure packages are installed.
  package { "zlib1g-dev":
    ensure => "installed",
  }

  exec { 'install cabal':
    command => '/tmp/puppet/modules/cabal/lib/install-cabal.sh',
    creates => '/home/vagrant/.cabal/bin/cabal',
    timeout => 0,
    require => [Package["zlib1g-dev"], User["cabal"], Package["wget"]],
  }

  # Update cabal package-list.
  exec { 'update-cabal-packages':
    command => '/tmp/puppet/modules/cabal/lib/update-cabal-packages.sh',
    require => Exec["install cabal"],
  }

  exec { "cabal-owner":
    command => "/bin/chown cabal:cabal /home/cabal/.cabal -R",
    require => Exec["update-cabal-packages"],
  }

  exec { "ghc-owner":
    command => "/bin/chown cabal:cabal /home/cabal/.ghc -R",
    require => Exec["update-cabal-packages"],
  }
}
