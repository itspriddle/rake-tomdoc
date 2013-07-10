# rake-tomdoc

Adds `rake tomdoc` to generate documentation for publishing to GitHub Pages.

## Setup

Add this gem as a development dependency to your projects Gemfile or gemspec:

```ruby
gem 'rake-tomdoc', group: :development

Gem::Specification.new do |s|
  ...
  s.add_development_dependency 'rake-tomdoc'
end
```

Create a gh-pages branch in your project. Make sure you have committed any
changes and your repository contains no untracked files!

```
$ git checkout --orphan gh-pages
$ git rm -rf .
$ git commit --allow-empty -m "Created gh-pages branch"
$ git checkout -
```

Require the gem in your `Rakefile`:

```ruby
require 'rake-tomdoc'
```

## Usage

When you are ready to publish new documentation:

```
$ rake tomdoc [--trace]
$ git commit -am "Updating documentation"
$ git push origin gh-pages
$ git checkout -
```

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Commit, do not bump version.
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2013 Site5.com. See LICENSE for details.
