desc "Generates TomDoc using `yard`, and copies it to the `gh-pages` branch."
task :tomdoc do
  def cmd(*args)
    error   = args.pop
    command = args.map(&:strip).join(' && ')
    output  = `#{command}`
    puts "+ #{command}", output if Rake.application.options.trace
    abort error unless $?.success?
  end

  def executor
    cmd "which git",  "Couldn't find `git`!"
    cmd "which yard", "Couldn't find `yard`!"

    cmd "git diff-files --quiet --ignore-submodules --",
      "git diff-index --cached --quiet HEAD --ignore-submodules --",
      "You must be on a clean branch to run this command"

    puts "Generating docs"

    Dir.mktmpdir do |dir|
      cmd "bundle exec yard doc --private --plugin tomdoc " <<
        "--output-dir #{dir} - LICENSE",
        "Couldn't generate docs!"

      cmd "git checkout gh-pages", "Couldn't checkout gh-pages branch!"
      cmd "cp -rv #{dir}/* .",     "Couldn't copy docs!"
    end

    puts "Done! Make sure to review the changes and push to GitHub!"
  end

  if defined?(Bundler)
    Bundler.with_clean_env(&method(:executor))
  else
    executor
  end
end
