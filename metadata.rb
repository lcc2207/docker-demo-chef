name 'docker-demo'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'All Rights Reserved'
description 'Installs/Configures docker-demo'
long_description 'Installs/Configures docker-demo'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

# issues_url 'https://github.com/<insert_org_here>/docker-demo/issues'
# source_url 'https://github.com/<insert_org_here>/docker-demo'

depends 'docker', '~> 4.2.0'
depends 'chef-sugar'
depends 'selinux', '~> 2.1.0'
