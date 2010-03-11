# Default Rails Template
# Warlley Rezende

# delete unnecessary files
run "rm README"
run "rm public/index.html"
run "rm public/favicon.ico"
run "rm public/robots.txt"
run "rm -f public/javascripts/*"

# set as a git repository
git :init
git :add => '.'

# copy database config to sample file
run "cp config/database.yml config/database.yml.sample"

# .gitignore files
run "touch tmp/.gitignore log/.gitignore"
file '.gitignore', <<-END
.DS_Store
Thumbs.db
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END

# plugins
plugin 'jrails', :git => 'git://github.com/aaronchi/jrails.git'
plugin 'autolinkable', :git => 'git://github.com/warlley/autolinkable.git'

# ruby gems
gem 'paperclip', :version => '>=2.3.1.1'
gem 'will_paginate', :version => '>=2.3.12'
gem 'formtastic', :version => '>=0.9.7'
gem 'devise', :version => '>=0.8.2'
rake('gems:install', :sudo => true)

# initialize submodules and first git commit
git :submodule => 'init'
git :add => '.'
git :commit => '-a -m "first commit"'
