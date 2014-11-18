# == Class: gitlab_cli::config
#
# Configures python-gitlab by creating ~/.python-gitlab.cfg for a given user
#
# === Authors
#
# Ilja Bobkevic <ilja.bobkevic@unibet.com>
#
# === Copyright
#
# Copyright 2014 North Development AB
#
class gitlab_cli::config(
  $path           = $::gitlab_cli::params::path,
  $owner          = $::gitlab_cli::params::owner,
  $url            = $::gitlab_cli::params::url,
  $private_token  = $::gitlab_cli::params::private_token,
  $ssl_verify     = $::gitlab_cli::params::ssl_verify,
  $timeout        = $::gitlab_cli::params::timeout
) inherits gitlab_cli::params {

  file { "$path/.python-gitlab.cfg":
    owner => $owner,
    mode  => 0400,
    content => template("${module_name}/python-gitlab.cfg.erb"),
  }
}
