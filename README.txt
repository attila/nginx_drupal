Drupal on nginx
===============

This configuration is for runnging multiple Drupal virtual hosts
on the nginx webserver with php-fpm.
The configuration is based on yhager's nginx implementation with
some customizations. https://github.com/yhager/nginx_drupal

Maintained by Attila Beregszaszi (attila [at] frontseed [dot] com)

FEATURES
--------

* Supports multisite
* Supports Boost module
* Supports Imagecache
* Supports Advanced CSS/JS Aggregation (advagg)
* Supports fake CNAME based CDNs for imagecache and advagg
* Configured to be fairly secure:
** only allow a couple of php scripts to run
** administrative scripts protected via htpasswd


REQUIREMENTS
------------

* Suggests use of Ubuntu 10.04 LTS (lucid)

* Relies upon latest stable nginx code (0.8.x branch)
  https://launchpad.net/~nginx/+archive/stable

* PHP 5.3.x with fpm
  https://launchpad.net/~nginx/+archive/php5
