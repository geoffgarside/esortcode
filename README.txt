= eSortCode

The main project site is on Rubyforge[http://esortcode.rubyforge.org]
and the source code is available at GitHub[http://github.com/geoffgarside/esortcode/tree/master].

== DESCRIPTION:

This gem provides an interface to the
eSortCode.com[http://www.esortcode.com] web service.

=== eSortCode.com
eSortCode.com[http://www.esortcode.com] is a pay-as-you-go
Web Service that enables your website, intranet, extranet
or desktop applications to validate and lookup UK Account
and Branch Details in real-time.

== FEATURES/PROBLEMS:

This is complete rewrite of the esortcode gem, it might be
a while before this version is up to the same level as the
previous version.

== SYNOPSIS:

  client = Esortcode::Client.new('USERNAME', 'LicenseID')

== REQUIREMENTS:

* HTTParty - http://httparty.rubyforge.org

Documentation generation requires Mislavs[http://github.com/mislav]
Hanna[http://github.com/mislav/hanna/tree/master] RDoc template.
You can install this with

  gem install mislav-hanna -s http://gems.github.com/

== INSTALL:

Use the normal method of installing gems

  gem install esortcode

to get development versions you can use the github gem

  gem install geoffgarside-esortcode -s http://gems.github.com/

== LICENSE:

(The MIT License)

Copyright (c) 2008 Geoff Garside

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.