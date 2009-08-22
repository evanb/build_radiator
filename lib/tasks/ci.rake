desc "Run tests. Developers should run this before committing"
#task :before_commit => ["db:migrate", "db:test:prepare", "spec:covered", "db:test:migrations", "features", "shindig:test"]
task :before_commit => ["db:migrate", "db:test:prepare", "spec"]

task :bc => "before_commit"

desc "ci build"
task :ci => [:before_commit]
