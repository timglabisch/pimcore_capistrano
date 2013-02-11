# default configuration values
load 'website/var/config/deploy/capistrano/pimcore/defaults'

# tasks
load 'website/var/config/deploy/capistrano/pimcore/task/deploy/finalize_update'
load 'website/var/config/deploy/capistrano/pimcore/task/deploy/migrate'

# setting up symlinks
load 'website/var/config/deploy/capistrano/pimcore/task/pimcore/symlink'

# enable suppert for different config directories
load 'website/var/config/deploy/capistrano/pimcore/task/pimcore/config'

# backup
load 'website/var/config/deploy/capistrano/pimcore/task/pimcore/backup'