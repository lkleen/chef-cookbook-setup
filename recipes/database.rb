include_recipe "database::mysql"
include_recipe "iptables"

iptables_rule "port_mysql" do
  cookbook "mysql"
end

iptables_rule "port_ssh" do
  cookbook "openssh"
end

mysql_connection_info = {
    :host => "localhost",
    :username => 'root',
    :password => node['mysql']['server_root_password']
}

mysql_database node['setup']['database']['name'] do
  connection mysql_connection_info
  action :create
end

mysql_database_user node['setup']['database']['user'] do
  connection mysql_connection_info
  password node['setup']['database']['pass']
  database_name node['setup']['database']['name']
  host '%'
  privileges [:all]
  action :create
  action :grant
end


