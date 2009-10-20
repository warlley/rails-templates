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
run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
file '.gitignore', <<-END
.DS_Store
Thumbs.db
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END

# submoduled plugins
plugin 'jrails', :git => 'git://github.com/aaronchi/jrails.git', :submodule => true
plugin 'js.erb-auto-include-plugin', :git => 'git://github.com/warlley/js.erb-auto-include-plugin.git', :submodule => true

# ruby gems
gem 'haml', :version => '>=2.0.6'
gem 'nofxx-annotate', :version => '>=2.2.5', :lib => 'annotate', :source => 'http://gems.github.com'
gem 'thoughtbot-paperclip', :version => '>=2.2.2', :lib => 'paperclip', :source => 'http://gems.github.com'
gem 'mislav-will_paginate', :version => '>=2.3.6', :lib => 'will_paginate', :source => 'http://gems.github.com'
gem 'authlogic', :version => '>=1.3.9'
gem 'justinfrench-formtastic', :version => '>=0.2.4', :lib => 'formtastic', :source => 'http://gems.github.com'
rake('gems:install', :sudo => true)

# initialize submodules and first git commit
git :submodule => 'init'
git :add => '.'
git :commit => '-a -m "first commit"'