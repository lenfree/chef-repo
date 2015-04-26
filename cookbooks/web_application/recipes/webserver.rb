#
# Cookbook Name:: web_application
# Recipe:: webserver
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apache2::default'

directory '/srv/apache/customers' do
  recursive true
end

# Use apache2 cookbook default recipe definition.
# This is my webapp Apache site config.
web_app 'customers' do
  template 'customers..conf.erb'
end

template '/srv/apache/customers/index.php' do
  source 'index.php'
  mode '0644'
  owner 'web_app'
  group 'web_app'
end

# Include Apache mod-php
include_recipe 'apache2::mod_php5'

# Install php-mysql package
package 'php-mysql' do
  action :install
  notifies :restart, 'service[apache2]'
end
