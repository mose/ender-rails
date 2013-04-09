# Ender::Rails

To fight the paretto monopoly of jQuery, let's have [Ender](http://ender.jit.su) and the Jeesh manage our javascript in Ruby on Rails. And an ender-ujs to make it right.

(Work in progress, not usable yet)

## Requirement

Rails >= 3.1

## Installation

Add this line to your application's Gemfile:

    gem 'ender-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ender-rails

## Install node

Ender-rails is going to help installing Nvm and Node with some simple rake task.
If you don't have Node.js already available, just run:

    rake node:install

## Usage

    rake ender:install

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
