task :compile do
  sh('bundle exec nanoc compile')
end

task :test => :compile do
  sh('bundle exec nanoc check --deploy')
end

task :clean do
  sh('rm -rf output/ tmp/')
  sh('rm -f crash.log output.diff')
end

task :view => :compile do
  sh('bundle exec nanoc view')
end

task :default => :compile
