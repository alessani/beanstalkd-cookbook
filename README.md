Description
===========

This cookbook provides an easy way to install beanstalkd: a fast, general-purpose work queue.

More information?
http://kr.github.com/beanstalkd/

Requirements
============

## Cookbooks:

This cookbook doesn't have direct dependencies on other cookbooks.

Attributes
==========

* `node['beanstalkd']['daemon_opts']` - The daemon opts value, defaults to ""
* `node['beanstalkd']['start_during_boot']` - The start during boot value, defaults to false

Usage
=====

1) include `recipe[beanstalkd]` in a run list
2) tweak the attributes via attributes/default.rb
	--- OR ---
	override the attribute on a higher level (http://wiki.opscode.com/display/chef/Attributes#Attributes-AttributesPrecedence)

References
==========

* [beanstalkd home page] (http://kr.github.com/beanstalkd/)

License and Authors
===================

Author: Matteo Alessani <alessani@gmail.com>
Copyright: 2012, Extendi

Unless otherwise noted, all files are released under the MIT license,
possible exceptions will contain licensing information in them.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
