#
# Cookbook Name:: web_application
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'web_application::default' do
  context 'web application cookbook' do
    let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

    it 'should contain user recipe' do
      expect(chef_run).to include_recipe('web_application::user')
    end
  end
end
