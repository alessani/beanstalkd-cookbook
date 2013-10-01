#
# Cookbook Name:: beanstalkd
# Recipe:: default
#
# Copyright 2012, Extendi
#

install_dir = "/usr/local/src/beanstalkd-1.8"

ark 'beanstalkd' do
  url "https://github.com/downloads/kr/beanstalkd/beanstalkd-1.8.tar.gz"
  version "1.8"
  path "/usr/local/src/beanstalkd"
  prefix_bin "/usr/local/bin"
  action :install_with_make
end

user node['beanstalkd']['user'] do
  comment "Beanstalkd User"
  gid 'nogroup'
  home node['beanstalkd']['bin_log_path']
  shell "/bin/sh"
end

if node['beanstalkd']['ebs_size'].to_i > 0
  aws = Chef::EncryptedDataBagItem.load("aws", "main")

  aws_ebs_volume "beanstalkd_ebs_volume" do
    aws_access_key aws['aws_access_key_id']
    aws_secret_access_key aws['aws_secret_access_key']
    size node['beanstalkd']['ebs_size']
    device "/dev/sdh"
    action [ :create, :attach ]
    if node['beanstalkd']['volume_type'] != 'standard'
      volume_type node['beanstalkd']['volume_type']
      piops node['beanstalkd']['piops']
    end
  end

  bash "format-data-beanstalkd" do
    code "mkfs.ext4 -j -F /dev/xvdh"
    not_if "e2label /dev/xvdh"
  end

  directory node['beanstalkd']['bin_log_path'] do
    owner node['beanstalkd']['user']
    group "nogroup"
  end

  mount node['beanstalkd']['bin_log_path'] do
    action [:mount, :enable]  # mount and add to fstab
    device '/dev/xvdh'
    fstype 'ext4'
    options 'defaults'
  end

  directory node['beanstalkd']['bin_log_path'] do
    recursive true
    owner node['beanstalkd']['user']
    group 'nogroup'
    mode '0755'
    action :create
  end
end

template "/etc/init/beanstalkd.conf" do
	source "startup.conf.erb"
	owner "root"
	group "root"
	mode 0644
end

template "/etc/default/beanstalkd" do
	source "beanstalkd.erb"
	owner "root"
	group "root"
	mode 0640
	variables(
		:daemon_opts => node['beanstalkd']['daemon_opts'],
		:start_during_boot => node['beanstalkd']['start_during_boot']
	)
	notifies :restart, "service[beanstalkd]"
end

service "beanstalkd" do
  provider Chef::Provider::Service::Upstart
	supports [:start, :restart, :stop, :status]
  #starts the service if it's not running and enables it to start at system boot time
	action [:enable, :start]
end
