
namespace :pimcore do
  namespace :config do

    task :dir do
      if "#{pimcore_conf_dir}" != "config"

        run "rm -rf #{release_path}/website/var/config"
        run "mv #{release_path}/website/var/#{pimcore_conf_dir} #{release_path}/website/var/config"

      end
    end

    task :all do
      dir
    end

  end
end