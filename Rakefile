require 'bundler'
Bundler.setup

require 'rake'

require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:cucumber)

require 'jeweler'
DEVELOPMENT_GROUPS=[:development, :test]
RUNTIME_GROUPS=Bundler.definition.groups - DEVELOPMENT_GROUPS
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20
  # for more options.
  gem.name = "to_bool"
  gem.homepage = "http://github.com/MrJoy/to_bool"
  gem.license = "MIT"
  gem.summary = %Q{Add a to_bool method to all objects that Does What You Mean.}
  gem.description = %Q{Add a to_bool method to all objects that Does What You Mean.}
  gem.email = "jfrisby@mrjoy.com"
  gem.authors = ["Jon Frisby"]
  gem.extra_rdoc_files = [ "README.md", "LICENSE", "CHANGELOG.md"]
  # gem.required_ruby_version = "> 1.9.2"

  # Jeweler wants to manage dependencies for us when there's a Gemfile.
  # We override it so we can skip development dependencies, and so we can
  # do lockdowns on runtime dependencies while letting them float in the
  # Gemfile.
  #
  # This allows us to ensure that using Friston as a gem will behave how
  # we want, while letting us handle updating dependencies gracefully.
  #
  # The lockfile is already used for production deployments, but NOT having
  # it be obeyed in the gemspec meant that we needed to add explicit
  # lockdowns in the Gemfile to avoid having weirdness ensue in GUI.
  #
  # This is probably a not particularly great way of handling this, but it
  # should suffice for now.
  gem.dependencies.clear

  Bundler.load.dependencies_for(*RUNTIME_GROUPS).each do |dep|
    runtime_resolved = Bundler.definition.specs_for(Bundler.definition.groups - DEVELOPMENT_GROUPS).select { |spec| spec.name == dep.name }.first
    if(!runtime_resolved.nil?)
      gem.add_dependency(dep.name, ">= #{runtime_resolved.version}")
    end
  end

  gem.files.reject! do |fn|
    fn =~ /^Gemfile.*/ ||
    fn =~ /^Rakefile/ ||
    fn =~ /^VERSION/ ||
    fn =~ /^cucumber\.yml/ ||
    fn =~ /^\.document/ ||
    fn =~ /^\.yardopts/ ||
    fn =~ /^features/ ||
    fn =~ /^coverage/ ||
    fn =~ /^doc/ ||
    fn =~ /^vendor\/cache/
  end
end
Jeweler::RubygemsDotOrgTasks.new

desc "delete generated files"
task :clobber do
  sh %q{find . -name "*.rbc" | xargs rm}
  sh 'rm -rf pkg'
  sh 'rm -rf coverage'
  sh 'rm -rf .yardoc'
  sh 'rm -rf doc'
end

require 'yard'
YARD::Rake::YardocTask.new do |t|
  # t.files   = ['features/**/*.feature', 'features/**/*.rb', 'lib/**/*.rb']
  # t.options = ['--any', '--extra', '--opts'] # optional
end

task :default => [:spec, :cucumber]
