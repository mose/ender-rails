#!/usr/bin/env rake

$:<< File.expand_path('../lib', __FILE__)

require "bundler/gem_tasks"

require 'rake/clean'
require 'rake/testtask'

load 'tasks/ender.rake'

task :default => :test

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.verbose = false
  t.test_files = FileList['test/test_*.rb']
end

task :default => :test