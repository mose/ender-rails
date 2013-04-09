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
      Rake::Task[:install_nvm].invoke unless ENV['NVM_BIN']
      node_version = ENV['NODE_VERSION'] || '0.8.16'
      sh "sh #{ENV['NVM_DIR']}/nvm.sh && nvm install #{node_version}"
    end

  end

  desc "install files from ender"
  task :install do
    Rake::Tasks['ender:node:install'].invoke unless `which npm`.size.>(0)
    sh 'npm install ender'
  end

  desc "check is ender is installed"
  task :check do
    Rake::Tasks['ender:install'].invoke unless `which ender`.size.>(0)
  end

  desc "build ender base jeesh packages (and remove all the rest)"
  task :build => :check do
    output_path = File.join(Rails.root,'app','assets','javascripts','ender')
    sh "ender build jeesh --output #{output_path}"
    FileUtils.rm("#{output_path}.min.js")
  end

  desc "refresh the build"
  task :build => :check do
    output_path = File.join(Rails.root,'app','assets','javascripts','ender')
    sh "ender refresh --use #{output_path}"
    FileUtils.rm("#{output_path}.min.js")
  end

  desc "show list of installed packages"
  task :info => :check do
    output_path = File.join(Rails.root,'app','assets','javascripts','ender')
    sh "ender info --use #{output_path}"
  end  

  desc "display ender help"
  task :help => :check do
    sh "ender"
  end 

  desc "add a package to the ender build"
  task :add, :package => :check, do |p|
    output_path = File.join(Rails.root,'app','assets','javascripts','ender')
    sh "ender add #{p[:package]} --use #{output_path}"
    FileUtils.rm("#{output_path}.min.js")
  end

  desc "remove a package from the ender build"
  task :remove, :package => :check do |p|
    output_path = File.join(Rails.root,'app','assets','javascripts','ender')
    sh "ender remove #{p[:package]} --use #{output_path}"
    FileUtils.rm("#{output_path}.min.js")
  end

end