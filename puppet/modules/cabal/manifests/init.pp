# Install cabal.

class cabal::install () {
  require ghc::install


  # Make sure packages are installed.
  package { "zlib1g-dev":
    ensure => "installed",
  }

  exec { 'install cabal':
    command => '/tmp/puppet/modules/cabal/lib/install-cabal.sh',
    user    => 'cabal',
    group   => 'cabal',
    creates => '/home/vagrant/.cabal/bin/cabal',
    timeout => 0,
    require => [Package["zlib1g-dev"], User["cabal"], Package["wget"]],
  }

  # Update cabal package-list.
  exec { 'update-cabal-packages':
    command => '/tmp/puppet/modules/cabal/lib/update-cabal-packages.sh',
    require => Exec["install cabal"],
  }
}
