class customproxy::server_install {

  package { 'nginx':
    ensure => installed,
  } 
  service { 'nginx':
    ensure => running,
    enable => true,
    require => Package["nginx"],
  }
    
  customproxy::server_install { 'domain.com ':
  ensure          => present,
  www_root        => '/var/www/nginx-default',
  ssl             => true,
  ssl_cert        => 'puppet:///modules/sslkey/mycert.crt',
  ssl_client_cert => 'puppet:///modules/sslkey/myclientcert.crt',
  ssl_key         => 'puppet:///modules/sslkey/certkey.key',
}

}
