chef-repo
=========

This contains LAMP cookbook to provision and configure web and db nodes with the use
of community cookbooks found in Supermarket.

Gettings Started:
-----------------

1. Download and install chef-dk from www.chef.io.
2. Sign up a free hosted Chef Organisation.
3. Create a organisation.
4. Download the starter-kit, this contains the key and knife config.

Run chefspec test:
------------------
```
cd cookbooks/web_application
bundle install
gem install bundler -v '1.9.4' - * might need to install this globally.
bundle exec guard
```
