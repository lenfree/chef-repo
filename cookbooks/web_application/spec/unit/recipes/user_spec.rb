#
# Cookbook Name:: web_application
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'web_application::user' do
  context 'create application user' do
    let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

    it 'should add group web_admin' do
      expect(chef_run).to create_group('web_admin')
    end

    it 'should add user web_admin with /bin/bash shell' do
      expect(chef_run).to create_user('web_admin').with(shell: '/bin/bash')
    end
  end
end
