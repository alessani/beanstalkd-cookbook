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
