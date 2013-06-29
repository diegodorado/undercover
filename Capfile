load 'deploy' if respond_to?(:namespace) # cap2 differentiator

set :application, "shitei"
set :deploy_to, "/home/hormigon/shitei"
set :build_path, "build" 
set :use_sudo, false
set :domain, 'shitei.cooph.com.ar'
set :user, 'hormigon'
role  :app, domain

before 'deploy:update_code' do
  run_locally "rm -rf #{build_path}/*"
  run_locally "middleman build"
end

namespace :deploy do
  desc <<-DESC
  Deploy to server via rsync
  DESC
  task :update_code, :roles => [:app] do
    on_rollback { delete release_path, :recursive => true }
    run_locally "rsync -e ssh -avz --delete  #{build_path} #{user}@#{domain}:#{shared_path}/#{build_path}"
    run "cp -R #{shared_path}/#{build_path}/* #{release_path}"
  end
end

