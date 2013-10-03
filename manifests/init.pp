# Class: git
#
# This class installs git
#
# Actions:
#   - Install the git package
#
# Sample Usage:
#  class { 'git': }
#
class git (
  $git_version = "1.8.3.2"
){
  if $operatingsystem == 'Darwin' {
    $source = "https://git-osx-installer.googlecode.com/files/git-${git_version}-intel-universal-snow-leopard.dmg"
    file { '/usr/local/bin':
      ensure => directory,
      require => Package['git'],
    }
    file { '/usr/local/bin/git':
      ensure => link,
      target => '/usr/local/git/bin/git',
      require => File['/usr/local/bin'],
    }
  }
  package { 'git':
    ensure => installed,
    source => $source,
  }
}
