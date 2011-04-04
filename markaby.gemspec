# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{markaby-rails3}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Fletcher", "why_", "Daniel Insley", "Ryan Barber", "Richard Ramsden"]
  s.date = %q{2011-04-01}
  s.description = %q{Markaby is a very short bit of code for writing HTML pages in pure Ruby.}
  s.email = %q{rfb@skyscraper.nu dinsley@gmail.com richard@rramsden.ca}
  s.files = [
     "README.md",
     "Rakefile",
     "init.rb",
     "lib/markaby.rb",
     "lib/markaby/builder.rb",
     "lib/markaby/builder_tags.rb",
     "lib/markaby/cssproxy.rb",
     "lib/markaby/rails/action_controller_helpers.rb",
     "lib/markaby/rails/template_handler.rb",
     "lib/markaby/railtie.rb",
     "lib/markaby/tags.rb",
     "markaby.gemspec",
     "test/app_root/.gitignore",
     "test/app_root/Gemfile",
     "test/app_root/Gemfile.lock",
     "test/app_root/Rakefile",
     "test/app_root/app/controllers/application_controller.rb",
     "test/app_root/app/controllers/markaby_controller.rb",
     "test/app_root/app/helpers/application_helper.rb",
     "test/app_root/app/helpers/markaby_helper.rb",
     "test/app_root/app/helpers/test_helper.rb",
     "test/app_root/app/views/markaby/_monkeys.mab",
     "test/app_root/app/views/markaby/broken.mab",
     "test/app_root/app/views/markaby/create.mab",
     "test/app_root/app/views/markaby/index.mab",
     "test/app_root/app/views/markaby/multiple_forms.mab",
     "test/app_root/config.ru",
     "test/app_root/config/application.rb",
     "test/app_root/config/boot.rb",
     "test/app_root/config/database.yml",
     "test/app_root/config/environment.rb",
     "test/app_root/config/environments/development.rb",
     "test/app_root/config/environments/production.rb",
     "test/app_root/config/environments/test.rb",
     "test/app_root/config/initializers/backtrace_silencers.rb",
     "test/app_root/config/initializers/inflections.rb",
     "test/app_root/config/initializers/mime_types.rb",
     "test/app_root/config/initializers/secret_token.rb",
     "test/app_root/config/initializers/session_store.rb",
     "test/app_root/config/locales/en.yml",
     "test/app_root/config/routes.rb",
     "test/app_root/db/schema.rb",
     "test/app_root/db/seeds.rb",
     "test/markaby_controller_test.rb",
     "test/markaby_test.rb",
     "test/monkeys.html",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/rfb/markaby}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.4.1}
  s.summary = %q{Markaby is a very short bit of code for writing HTML pages in pure Ruby.}
  s.test_files = [
    "test/app_root/app/controllers/application_controller.rb",
     "test/app_root/app/controllers/markaby_controller.rb",
     "test/app_root/app/helpers/application_helper.rb",
     "test/app_root/app/helpers/markaby_helper.rb",
     "test/app_root/app/helpers/test_helper.rb",
     "test/app_root/config/application.rb",
     "test/app_root/config/boot.rb",
     "test/app_root/config/environment.rb",
     "test/app_root/config/environments/development.rb",
     "test/app_root/config/environments/production.rb",
     "test/app_root/config/environments/test.rb",
     "test/app_root/config/initializers/backtrace_silencers.rb",
     "test/app_root/config/initializers/inflections.rb",
     "test/app_root/config/initializers/mime_types.rb",
     "test/app_root/config/initializers/secret_token.rb",
     "test/app_root/config/initializers/session_store.rb",
     "test/app_root/config/routes.rb",
     "test/app_root/db/schema.rb",
     "test/app_root/db/seeds.rb",
     "test/markaby_controller_test.rb",
     "test/markaby_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end