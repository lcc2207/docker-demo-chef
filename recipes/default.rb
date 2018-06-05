selinux_state 'disabled' do
  action :disabled
  only_if { centos? }
end

# install docker
docker_installation 'default' do
  version node['docker-demo']['docker']['version']
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
  logfile node['docker-demo']['docker']['logfile']
  action :start
end

docker_image node['docker-demo']['docker']['imgname'] do
  action :pull_if_missing
end

docker_container node['docker-demo']['docker']['containername'] do
  container_name node['docker-demo']['docker']['containername']
  image node['docker-demo']['docker']['imgname']
  port node['docker-demo']['docker']['portmap']
  tag node['docker-demo']['docker']['regversion']
  binds ['/var/lib/jenkins:/var/jenkins_home']
  restart_policy 'always'
  action :run_if_missing
end
