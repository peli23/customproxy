
customproxy::proxy_log { 'https://domain.com':
  ensure      => present,
  listen_port => 8888,
  resolver    => 8.8.8.8,  
  proxy_pass  => localhost:443,
  log_format  => custom  '$server_protocol, $remote_addr, $request_time',
  access_log  => /var/log/nginx-access.log custom,
  error_log   => /var/log/nginx-error.log custom,
}



