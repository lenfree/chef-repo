#
# Cookbook Name:: web_application
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'web_application::webserver' do
  before do
    stub_command('/usr/sbin/apache2 -t').and_return(true)
  end

  context 'provision web server' do
    let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

    it 'should include apache2 cookbook default recipe' do
      expect(chef_run).to include_recipe('apache2::default')
    end

    it 'should contain custom Apache root directory' do
      expect(chef_run).to create_directory('/srv/apache/customers').with(recursive: true)
    end

    it 'should have application index.php' do
      expect(chef_run).to create_template('/srv/apache/customers/index.php').with(mode: '0644', owner: 'web_app', group: 'web_app')
    end

    it 'should include apache2 cookbook default recipe' do
      expect(chef_run).to include_recipe('apache2::mod_php5')
    end

    it 'should install php-mysql package' do
      expect(chef_run).to install_package('php-mysql')
    end

    it 'should notify apache2 after install' do
      resource = chef_run.package('php-mysql')
      expect(resource).to notify('service[apache2]').to(:restart)
    end
  end
end
