namespace :build_plans do
  desc "Update build plans"
  task :update_all => :environment do
    BuildPlan.update_all
    puts "plans updated"
  end
end

