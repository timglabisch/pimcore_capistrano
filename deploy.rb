# Howto
# At first you need at least one server to deploy to.
# create the path :deploy_to, :deploy_to/releases and :deploy_to/shared ( :deploy_to is a variable in the server settings ... )


set :application, "pimcore_project"

task :production do
  puts " "
  puts " ###################################################################### "
  puts " # "
  puts " # Capistrano -> Production"
  puts " # "
  puts " # "
  puts " ###################################################################### "
  puts " "

  # capistrano doesnt suppert to deploy to the same machine.
  role :app, "pimcore.capistrano", :master => true

  set :deploy_to, "/var/www/#{application}"
  set :user, "ubuntu"
  # set :password, "********" # please use ssh public <-> private key auth
end

task :staging do
  puts " "
  puts " ###################################################################### "
  puts " # "
  puts " # Capistrano -> Staging"
  puts " # "
  puts " # "
  puts " ###################################################################### "
  puts " "

  # capistrano doesnt suppert to deploy to the same machine.
  role :app, "pimcore.capistrano", :master => true

  set :deploy_to, "/var/www/#{application}"
  set :user, "ubuntu"
  # set :password, "********" # please use ssh public <-> private key auth
end

after "deploy:update", "deploy:cleanup"

after "deploy:finalize_update", "pimcore:config:all"
after "deploy:finalize_update", "pimcore:symlink:all"