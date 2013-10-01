#
# Cookbook Name:: beanstalkd
# Attributes:: default
#
# Copyright 2012, Extendi
#
default['beanstalkd']['bin_log_path'] = "/mnt/beanstalkd"
default['beanstalkd']['user'] = "beanstalkd"
default['beanstalkd']['daemon_opts'] = ""
default['beanstalkd']['start_during_boot'] = false
default["beanstalkd"]["volume_type"] = "standard"
default["beanstalkd"]["piops"] = 100