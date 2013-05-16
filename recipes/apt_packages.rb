#
# Cookbook Name:: setup
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'

node['setup']['packages'].each do |package|
  execute "installing package #{package}" do
    command "sudo apt-get install -y #{package}"
  end
end
