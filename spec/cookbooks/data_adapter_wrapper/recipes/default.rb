#
# Cookbook Name:: data_adapter_wrapper
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'data_adapter::default'

data_adapter_source 'Rigel' do
  action :nothing
  url 'bag://stars/rigel'
end.run_action(:load)
