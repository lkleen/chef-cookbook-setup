name             'setup'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures setup'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe "database", "Empty placeholder"
recipe "database::master", "Creates application specific user and database"

depends "mysql", ">= 1.3.0"

%w{ debian ubuntu centos suse fedora redhat scientific amazon }.each do |os|
  supports os
end