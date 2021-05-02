customproxy::proxy_config { 'https://domain.com':
  ensure      => present,
  server_name => ['domain.com domain'],
  proxy       => '10.10.10.10',
}


customproxy::proxy_config { 'https://domain.com':
  ensure   => present,
  www_root => '/var/www/nginx-default/resource2',
  location => '/resource2',
  server   => 'domain.com domain',
  proxy    => '20.20.20.20',
}
