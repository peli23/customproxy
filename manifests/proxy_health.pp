customproxy::proxy_health { 'https://.domain.com':
  location => {
    proxy_pass => 'https://domain.com',
    health_check => port 8080,
   },
}

