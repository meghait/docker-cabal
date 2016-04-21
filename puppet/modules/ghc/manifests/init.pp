# Install GHC.

class ghc::install () {
  # Make sure packages are installed.
  package { "libgmp3-dev":
    ensure => "installed",
  }
  package { "xz-utils":
    ensure => "installed",
  }
  package { "make":
    ensure => "installed",
  }
  package { "build-essential":
    ensure => "installed",
  }
  package { "libssl-dev":
    ensure => "installed",
  }

  exec { 'install GHC':
    command => '/tmp/puppet/modules/ghc/lib/install-ghc.sh',
    creates => '/usr/local/bin/ghc',
    timeout => 0,
    environment => ["HOME=/root"],
    require => [Package["libgmp3-dev"], Package["wget"], Package["xz-utils"], Package["make"], Package["build-essential"]],
  }
}
