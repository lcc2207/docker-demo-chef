name 'docker-demo'
maintainer 'Lynn Caldwell'
maintainer_email 'lynn@scalr.com'
license 'All Rights Reserved'
description 'Installs/Configures docker-demo'
long_description 'Installs/Configures docker-demo'
version '0.1.3'
chef_version '>= 12.1' if respond_to?(:chef_version)

issues_url 'https://github.com/lcc2207/docker-demo-chef/issues'
source_url 'https://github.com/lcc2207/docker-demo-chef'

depends 'docker', '~> 4.2.0'
depends 'chef-sugar'
depends 'selinux', '~> 2.1.0'
