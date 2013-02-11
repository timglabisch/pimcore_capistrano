
namespace :pimcore do
  namespace :symlink do

    task :assets do
      run "mkdir -p #{shared_path}/assets"
      run "cp -rf #{release_path}/website/var/assets #{shared_path}/assets"

      run "rm -rf #{release_path}/website/var/assets"
      run "ln -nfs #{shared_path}/assets #{release_path}/website/var/assets"
    end

    task :backups do
      run "mkdir -p #{shared_path}/backup"
      run "cp -rf #{release_path}/website/var/backup #{shared_path}/backup"

      run "rm -rf #{release_path}/website/var/backup"
      run "ln -nfs #{shared_path}/backup #{release_path}/website/var/backup"
    end

    task :classes do
      run "mkdir -p #{shared_path}/classes"
      run "cp -rf #{release_path}/website/var/classes #{shared_path}/classes"

      run "rm -rf #{release_path}/website/var/classes"
      run "ln -nfs #{shared_path}/classes #{release_path}/website/var/classes"
    end

    task :logs do
      run "mkdir -p #{shared_path}/log"
      run "cp -rf #{release_path}/website/var/log #{shared_path}/log"

      run "rm -rf #{release_path}/website/var/log"
      run "ln -nfs #{shared_path}/log #{release_path}/website/var/log"
    end

    task :versions do
      run "mkdir -p #{shared_path}/versions"
      run "cp -rf #{release_path}/website/var/versions #{shared_path}/versions"

      run "rm -rf #{release_path}/website/var/versions"
      run "ln -nfs #{shared_path}/versions #{release_path}/website/var/versions"
    end

    task :recyclebin do
      run "mkdir -p #{shared_path}/recyclebin"
      run "cp -rf #{release_path}/website/var/recyclebin #{shared_path}/recyclebin"

      run "rm -rf #{release_path}/website/var/recyclebin"
      run "ln -nfs #{shared_path}/versions #{release_path}/website/var/recyclebin"
    end

    task :all do
      assets
      backups
      classes
      logs
      versions
      recyclebin
    end

  end
end