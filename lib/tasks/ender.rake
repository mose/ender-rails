OUTPUT = File.join('app','assets','javascripts','ender')

namespace :ender do

  namespace :node do

    desc "install nvm"
    task :install_nvm do
      begin
        if `which curl`.size.>(0)
          sh "curl https://raw.github.com/creationix/nvm/master/install.sh | sh"
        else
          sh "wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh"
        end
        puts "NVM : https://github.com/creationix/nvm"
        puts "has been installed for your account. NVM is the node/npm version manager."
        puts "If you liked RVM, you will feel like at home."
        puts
      rescue Exception => e
        puts e
        puts e.backtrace
      end
    end

    desc "install node version NODE_VERSION (default 0.8.16)"
    task :install do
      Rake::Task['ender:node:install_nvm'].invoke unless ENV['NVM_DIR']
      node_version = ENV['NODE_VERSION'] || '0.8.16'
      sh "/bin/bash -c 'source ~/.nvm/nvm.sh && nvm install #{node_version}'"
    end

  end

  desc "install files from ender"
  task :install do
    if `which npm`.size.<=(0)
      if ENV['NVM_DIR']
        node_version = ENV['NODE_VERSION'] || '0.8.16'
        sh "/bin/bash -c 'source #{ENV['NVM_DIR']}/nvm.sh && nvm install #{node_version} && nvm use #{node_version}'"
      else
        Rake::Task['ender:node:install'].invoke
      end
    end
    sh 'npm install ender -g'
    puts "Please run 'source ~/.nvm/nvm.sh && nvm use #{node_version}' to reload nodejs environment '"
  end

  desc "check if ender is installed"
  task :check do
    Rake::Task['ender:install'].invoke unless `which ender`.size.>(0)
  end

  desc "build ender base Jeesh package (careful it rebuilds from scratch)"
  task :build => :check do
    sh "ender build jeesh --output #{OUTPUT}"
    FileUtils.rm("#{output_path}.min.js") if File.exist?("#{OUTPUT}.min.js")
  end

  desc "refresh the build"
  task :refresh => :check do
    sh "ender refresh --use #{OUTPUT}"
    FileUtils.rm("#{output_path}.min.js") if File.exist?("#{OUTPUT}.min.js")
  end

  desc "show list of installed packages"
  task :info => :check do
    sh "ender info --use #{OUTPUT}"
  end

  desc "display ender help"
  task :help => :check do
    sh "ender"
  end

  desc "add a package to the ender build"
  task :add, [:package] => [:check] do |t,p|
    sh "ender add #{p[:package]} --use #{OUTPUT}"
    FileUtils.rm("#{output_path}.min.js") if File.exist?("#{OUTPUT}.min.js")
  end

  desc "remove a package from the ender build"
  task :remove, [:package] => [:check] do |t,p|
    sh "ender remove #{p[:package]} --use #{OUTPUT}"
    FileUtils.rm("#{output_path}.min.js") if File.exist?("#{OUTPUT}.min.js")
  end

end
