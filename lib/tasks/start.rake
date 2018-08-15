namespace :start do
  desc 'Start dev server'
  task development: :environment do
    exec 'foreman start -f Procfile.dev'
  end
end

task start: 'start:development'
