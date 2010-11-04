Supr
====

Supr is a gem wrapping Stumble Upon's Su.pr url shortening service.  The api is relatively new 
and thin on features, but this gem gives you access to the shorten and expand methods.  More 
support for the post method is planned.  Statistic information is still covered by the api 
but when that is exposed, it will be added here. 

**Supr uses [semantic versioning][semvar] and the api should be considered unstable until version 1.0.0. 
*Consider yourself warned*.**

Installation
------------

gem install supr

Usage
-----

Create a Bitly client using your username and api key as follows:

supr\_client = Supr.new(username, api_key)

You can then use that client to shorten or expand urls as so:

supr\_client.shorten('http://www.google.com')
supr\_client.shorten('http://www.google.com')
supr\_client.expand('xJs4E')

Special Thanks
--------------

This gem is mostly based on the [bitly gem][bitly] written by [Phil Nash][phil].  Special
thanks to him for the code base to start with.  

Note on Patches/Pull Requests
-----------------------------
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit 
  by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

Copyright
---------

Copyright (c) 2010 Blake Chambers. See LICENSE for details.
