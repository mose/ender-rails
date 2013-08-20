# Ender-Rails

To fight the paretto monopoly of jQuery, let's have [Ender](http://ender.jit.su) and [the Jeesh](https://github.com/ender-js/jeesh) manage our javascript in Ruby on Rails. And an [ender-ujs](https://github.com/mose/ender-ujs) to make it right.


## Requirement

* Rails >= 3.1
* Node >= 0.4

## Installation

Add this line to your application's Gemfile:

    gem 'ender-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ender-rails

## Node installation

Ender-rails is going to help installing Nvm and Node with some simple rake task.
If you don't have Node.js already available, just run:

    rake ender:node:install

Honestly it can also be a good occasion to begin checking out this tool if you have not already.

## Usage

    rake ender:install

When ender is installed you can use ender instead of "rake ender"

    rake ender:build # will copy a version of the jeesh in app/assets/javascripts/
    rake ender:info # lists installed packages
    rake ender:help
    rake ender:add[somepackage]
    rake ender:remove[somepackage]

Rake is a bit awkward when it comes to pass arguments, so here are the was to do it

    rake ender:add[somepackage]
    rake ender:add['somepackage someother']
    rake ender:add[somepackage\ someother]
    rake ender:add['somepackage someother ../src/some_local_package']

Find list of available ender packages on https://github.com/ender-js/Ender/wiki/Ender-package-list

Refer to [ender documentation](http://ender.jit.su/#docs) on how to add more flecibility in your javascript package binder.

In your views, you can then use the basic [Jeesh tools](https://github.com/ender-js/jeesh) which you feel like you are using jQuery for most parts (without the bulk).

## Todo

* create an ender-ujs package (see https://github.com/mose/ender-ujs)
* add more rake commands
* test the install on various ruby versions (using apraisal ?)
* write some rake tests
* fix the nvm install and usage

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Copyright (c) 2013 mose - distributed under MIT license
