require 'bundler/gem_tasks'
require 'rake/testtask'
require 'rubocop/rake_task'

# rake console
# provide a debug console for development
task :console do
  exec 'irb -r vbs_sql_reporter -I ./lib'
end

task :doc_coverage do
  exec 'rdoc -C lib'
end

task :doc do
  exec 'rdoc lib'
end

# rake task for unit testing (make this default)
Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

task default: :test

# rake rubocop
# run rubocop over the source code
RuboCop::RakeTask.new
