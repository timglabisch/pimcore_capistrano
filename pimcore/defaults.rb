
# you can overwrite all values in the /website/var/conf/deploy.rb

# # # # #
#
# pimcore defaults
#
# # # # #

# capistrano will drop the conf ordner and rename this Ordner to conf.
# this allows you to distribute configurations for different environments
# if you set the value to "config" nothing will happen.
#
# for example:
#
# 1. create the directory website/var/conf_production
# 2. set :pimcore_conf_dir, "config_production"
# on the next deployment website/var/confif will be removed and website/var/config_production will be renamed to website/var/config
set :pimcore_conf_dir, "config"

# pimcore database configuration
# just needed for optional tasks like db backups ...
set :pimcore_database_mysql_host, ""
set :pimcore_database_mysql_username, ""
set :pimcore_database_mysql_password, ""
set :pimcore_database_mysql_dbname, ""

set :pimcore_backup_folder, "/tmp"

# # # # #
#
# capistrano defauts
#
# # # # #

ssh_options[:port] = 22
ssh_options[:paranoid] = false
default_run_options[:pty] = true

set :deploy_via, :copy
set :copy_strategy, :export
set :repository, "."
set :keep_releases, 5
set :scm, :none
set :use_sudo, true
set :run_method, :sudo
