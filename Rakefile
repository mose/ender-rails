#!/usr/bin/env rake

$:<< File.expand_path('../lib', __FILE__)

require "bundler/gem_tasks"

require 'rake/clean'
require 'rake/testtask'


require 'rails-ender/which'

task :default => :test

Rake::TestTask.new do |t|
  t.verbose = false
  t.test_files = FileList['test/test_*.rb']
end