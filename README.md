Description
===========

This cookbook installs win32-eventlog RubyGem and uses it in a
report/exception handler that sends messages to Windows Event Log.

Requirements
============

## Platform:

Windows

Tested on Windows 7. Should work anywhere the win32-eventlog gem works.

## Cookbook:

chef_handler

Usage
=====

Include `recipe[eventlog]` to have the gem installed, the handler
library copied to the proper location and the handler set up to be
used in the Chef run.

You'll probably want to modify the `win32_eventlog_handler.rb` to
provide more detailed information.

Roadmap
=======

Enable better logging with more informative output.

Changes
=======

## v0.0.1

- Initial release

License and Author
==================

Author: Joshua Timberman (<joshua@opscode.com>)

Copyright 2011, Opscode, Inc. (<legal@opscode.com>)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
