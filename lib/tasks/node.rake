

namespace :node do
  
  desc "install nvm"
  task :install do

    perform_command do
      if EnderRails::Tools.which 'curl'
        sh "curl https://raw.github.com/creationix/nvm/master/install.sh | sh"
      else
        sh "wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh"
      end
      puts "NVM : https://github.com/creationix/nvm"
      puts "has been installed for your account. NVM is the node/npm version manager."
      puts "If you liked RVM, you will feel like at home."
    rescue Exception => e
      puts e
      puts e.backtrace
    end
  end
  
end
