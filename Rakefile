require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rcov/rcovtask'

begin
  require 'jeweler'

  Jeweler::Tasks.new do |s|
    s.name = "markaby"
    s.summary = "Markaby is a very short bit of code for writing HTML pages in pure Ruby."
    s.email = "rfb@skyscraper.nu dinsley@gmail.com"
    s.homepage = "http://github.com/rfb/markaby"
    s.description = "Markaby is a very short bit of code for writing HTML pages in pure Ruby."
    s.authors = ["Tim Fletcher", "why_", "Daniel Insley", "Ryan Barber"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

task :test do
  Rake::TestTask.new do |t|
    t.libs << 'lib'
    t.pattern = ['test/markaby_test.rb']
    t.verbose = false
  end

  Rake::TestTask.new do |t|
    t.libs << 'lib'
    t.pattern = ['test/markaby_controller_test.rb']
    t.verbose = false
  end
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'Jeweler'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Rcov::RcovTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['markaby_test.rb', 'test/markaby_controller_test.rb']
  t.verbose = true
end

task :default => :test
