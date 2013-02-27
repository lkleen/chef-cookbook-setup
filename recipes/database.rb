include_recipe "database::mysql"

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


