class nginx {
    package {'nginx':
        ensure => installed
    }

    file {'/etc/nginx/nginx.conf':
        ensure => file,
        source => '/etc/puppet/modules/nginx/files/nginx.conf',
        require => Package['nginx'],
        notify => Service['nginx']
    }
    service {'nginx':
        ensure => running,
        enable => true,
        hasrestart => true,
        hasstatus => true,
        #restart => 'systemctl restart nginx.serivce',
        require => [Package['nginx'], File['/etc/nginx/nginx.conf']]
    }
}
