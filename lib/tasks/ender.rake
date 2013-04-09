require 'json'

namespace :ender do

  desc "install files from ender"
  task :install do
    perform_command do
      sh 'ender build'
    end
  end

  desc "update ender packages"
  task :update do
    perform_command false do
      sh 'ender update'
    end
  end
end

def perform_command remove_components = true
  txt = File.read("#{Rails.root}/bower.json")
  json = JSON.parse(txt)

  ["lib", "vendor"].each do |dir|

    data = json[dir]

    #check folder existence and create?
    dir = "#{Rails.root}/#{dir}/assets/javascripts"
    FileUtils.mkdir_p dir unless File.directory? dir
    #go in to dir to act
    Dir.chdir(dir) do

      #remove old components
      FileUtils.rm_rf("components") if remove_components

      #create component json
      File.open("component.json","w") do |f|
        f.write(data.to_json)
      end

      #run command
      yield

      #remove component file
      FileUtils.rm("component.json")

    end if data

  end
end