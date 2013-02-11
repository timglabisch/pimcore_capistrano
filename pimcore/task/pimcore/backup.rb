
namespace :pimcore do
  namespace :backup do

    task :backup_shared, :roles => :app, :only => { :master => true } do
      run "mkdir -p #{pimcore_backup_folder}/#{release_name}"
      run "cp -R #{shared_path} #{pimcore_backup_folder}/#{release_name}"
    end

    task :backup_all, :roles => :app, :only => { :master => true } do
      run "mkdir -p #{pimcore_backup_folder}/#{release_name}"
      run "cp -R -L #{current_path} #{pimcore_backup_folder}/#{release_name}"
    end

    task :backup_db, :roles => :db, :only => { :master => true } do
      run "mkdir -p #{pimcore_backup_folder}/#{release_name}"
      run("mysqldump -h#{pimcore_database_mysql_host} -u#{pimcore_database_mysql_username} -p#{pimcore_database_mysql_password} #{pimcore_database_mysql_dbname} | gzip -9 > #{pimcore_backup_folder}/#{release_name}/mysql.backup.sql.gz");
    end

    task :downloadAndtidyUp do
      run "tar -czPf #{pimcore_backup_folder}/#{release_name}.tgz #{pimcore_backup_folder}/#{release_name}/"
      download("#{pimcore_backup_folder}/#{release_name}.tgz", "backup_$CAPISTRANO:HOST$_#{release_name}.tgz")
      run "rm #{pimcore_backup_folder}/#{release_name}.tgz"
      run "rm -rf #{pimcore_backup_folder}/#{release_name}"
    end

    task :download_shared do
      backup_shared
      backup_db
      downloadAndtidyUp
    end

    task :download_all do
      backup_all
      backup_db
      downloadAndtidyUp
    end

  end
end