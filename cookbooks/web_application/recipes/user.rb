#
# Cookbook Name:: web_application
# Recipe:: user
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

group 'web_admin' do
  action :create
end

user 'web_admin' do
  action :create
  group 'web_admin'
  system true
  shell '/bin/bash'
end
