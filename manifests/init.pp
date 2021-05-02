# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include custom-proxy

class customproxy {

  include customproxy::server_install.pp
  include customproxy::proxy_config.pp 
  include customproxy::proxy_log.pp 
  include customproxy::proxy_health.pp

}
