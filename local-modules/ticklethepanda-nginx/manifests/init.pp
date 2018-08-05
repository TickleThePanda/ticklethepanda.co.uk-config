class nginx {
  package { 'nginx':
    ensure => 'installed'
  }

  file { '/etc/nginx/conf.d/':
    ensure => 'directory',
    recurse => true,
    source => 'puppet:///modules/nginx/conf.d/'
  }

  file { '/etc/nginx/default.d/':
    ensure => 'directory',
    recurse => true,
    source => 'puppet:///modules/nginx/default.d/'
  }

  file { '/etc/nginx/includes.d/':
    ensure => 'directory',
    recurse => true,
    source => 'puppet:///modules/nginx/includes.d/'
  }

  file { '/etc/nginx/nginx.conf':
    ensure => 'present',
    source => 'puppet:///modules/nginx/nginx.conf'
  }

  file { '/etc/nginx/mime.types':
    ensure => 'present',
    source => 'puppet:///modules/nginx/mime.types'
  }

  service { 'nginx':
    ensure => 'running',
    subscribe => [
      File['/etc/nginx/conf.d/'],
      File['/etc/nginx/default.d/'],
      File['/etc/nginx/includes.d/'],
      File['/etc/nginx/nginx.conf/'],
      File['/etc/nginx/mime.types/']
    ]
  }
}
