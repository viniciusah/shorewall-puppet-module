class shorewall ($rules_file) {

  package { shorewall:
    ensure => installed,
    alias  => shorewall
  }

  file { 'zones':
    path    => '/etc/shorewall/zones',
    ensure  => file,
    require => Package['shorewall'],
    source  => "puppet:///files/etc/shorewall/zones",
    notify  => Service["shorewall"]
  }

  file { 'interfaces':
    path    => '/etc/shorewall/interfaces',
    ensure  => file,
    require => Package['shorewall'],
    source  => "puppet:///files/etc/shorewall/interfaces",
    notify  => Service["shorewall"]
  }

  file { 'hosts':
    path    => '/etc/shorewall/hosts',
    ensure  => file,
    require => Package['shorewall'],
    source  => "puppet:///files/etc/shorewall/hosts",
    notify  => Service["shorewall"]
  }

  file { 'policy':
    path    => '/etc/shorewall/policy',
    ensure  => file,
    require => Package['shorewall'],
    source  => "puppet:///files/etc/shorewall/policy",
    notify  => Service["shorewall"]
  }

  file { 'routestopped':
    path    => '/etc/shorewall/routestopped',
    ensure  => file,
    require => Package['shorewall'],
    source  => "puppet:///files/etc/shorewall/routestopped",
    notify  => Service["shorewall"]
  }

  file { 'common-rules':
    path    => '/etc/shorewall/rules.common',
    ensure  => file,
    require => Package['shorewall'],
    source  => "puppet:///files/etc/shorewall/rules.common",
    notify  => Service["shorewall"]
  }


  file { 'rules':
    path    => '/etc/shorewall/rules',
    ensure  => file,
    require => Package['shorewall'],
    source  => $rules_file,
    notify  => Service["shorewall"]
  }

  service {'shorewall':
    ensure => 'running',
    enable => 'true',
    hasstatus => false,
    status => 'shorewall status',
    require => Package['shorewall']
  }

}
