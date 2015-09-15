#ruby-gemset=to_bool
ruby "2.2.3"
source 'https://rubygems.org'

# Code quality:
group :development do
  #############################################################################
  # Development Workflow
  #############################################################################
  gem 'rake'
  gem 'jeweler'

  #############################################################################
  # Documentation
  #############################################################################
  platforms :ruby do
    gem 'yard',          :require => false
    gem 'yard-cucumber', :require => false
    gem 'redcarpet'
    gem 'github-markup'
  end

  #############################################################################
  # Code Quality
  #############################################################################
  gem 'cane',      :require => false
  gem 'brakeman',  :require => false
end

group :test do
  #############################################################################
  # Testing Infrastructure
  #############################################################################
  gem 'cucumber',  :require => false
  gem 'simplecov', :require => false
end
