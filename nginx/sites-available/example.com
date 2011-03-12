##
## Example.com Drupal site
##
server {
  listen       80;
  server_name  example.com www.example.com;
  set          $real_domain 'example.com';
  limit_conn   gulag 10;
  root         /srv/www/example/example.com/public;
  access_log   /srv/www/example/example.com/log/access.log main;
  error_log    /srv/www/example/example.com/log/error.log;

  ## Redirect alias domains to real domain.
  if ($host != $real_domain) {
    rewrite ^/(.*)$  http://$real_domain/$1 permanent;
  }

  include rules_production;
  include drupal/drupal-php53;
}

## Cookieless fake CDN domains
server {
  listen       172.22.1.7:80;
  server_name  example-1.cdn.net example-2.cdn.net;
  limit_conn   gulag 10;
  root         /srv/www/example/example.com/public;
  access_log   /srv/www/example/example.com/log/cdn_access.log main;
  error_log    /srv/www/example/example.com/log/cdn_error.log;

  include rules_production;
  include drupal/drupal_common;
  include drupal/cdn-php53;
}
