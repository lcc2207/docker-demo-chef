selinux_state 'disabled' do
  action :disabled
  only_if { centos? }
end

# install docker
docker_installation 'default' do
  version node['docker-demo']['version']
  action :create
end

# the jekins container user UID is 1000 as is the Ubuntu AMI user
directory '/var/lib/jenkins' do
  owner 'ubuntu'
  group 'ubuntu'
  mode '0755'
  action :create
  recursive true
end

docker_service_manager 'default' do
  host ["tcp://#{node['ipaddress']}:2375", 'unix:///var/run/docker.sock']
  logfile node['docker-demo']['logfile']
  action :start
end

docker_image node['docker-demo']['imgname'] do
  action :pull_if_missing
end

docker_container node['docker-demo']['containername'] do
  container_name node['docker-demo']['containername']
  image node['docker-demo']['imgname']
  port node['docker-demo']['portmap']
  tag node['docker-demo']['regversion']
  binds node['docker-demo']['binds']
  restart_policy 'always'
  action :run_if_missing
end
