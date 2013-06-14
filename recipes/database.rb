include_recipe 'database::mysql'
include_recipe 'iptables'

iptables_rule 'port_mysql' do
  cookbook 'mysql'
end

iptables_rule 'port_ssh' do
  cookbook 'openssh'
end

databases = node['setup']['databases']

databases.each do |database|
  Chef::Log.debug "creating database #{database[:name]}"

  name = database[:name]
  user = database[:user]
  pass = database[:pass]
  host = database[:host]
  server_root_user = 'root'
  server_root_pass = node['mysql']['server_root_password']

  mysql_connection_info = {
      :host => host,
      :username => server_root_user,
      :password => server_root_pass
  }

  mysql_database name do
    connection mysql_connection_info
    action :create
  end

  mysql_database_user user do
    connection mysql_connection_info
    password pass
    database_name name
    host '%'
    privileges [:all]
    action :create
    action :grant
  end

end



