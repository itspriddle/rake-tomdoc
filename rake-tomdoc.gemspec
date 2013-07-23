Gem::Specification.new do |s|
  s.platform   = Gem::Platform::RUBY
  s.name       = "rake-tomdoc"
  s.version    = "0.0.1"
  s.summary    = "rake-tomdoc"
  s.homepage   = "https://github.com/site5/rake-tomdoc"
  s.authors    = ["Joshua Priddle", "Justin Mazzi"]
  s.email      = ["jpriddle@me.com", "jmazzi@site5.com"]
  s.license    = 'MIT'

  s.files      = %w[ Rakefile README.markdown lib/rake-tomdoc.rb ]

  s.add_dependency "rake"
  s.add_dependency "yard-tomdoc", "~> 0.7.1"
end
