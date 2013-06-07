#
# Cookbook Name:: setup
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'

# update apt cache in compile phase
e = execute "apt-get update" do
  action :nothing
end
e.run_action(:run)

node['setup']['packages'].each do |package|
  execute "installing package #{package}" do
    command "sudo apt-get install -y #{package}"
  end
end
