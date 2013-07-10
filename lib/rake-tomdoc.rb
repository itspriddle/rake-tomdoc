desc "Generates TomDoc using `yard`, and copies it to the `gh-pages` branch."
task :tomdoc do
  runner = Proc.new do |command, error|
    %x{#{command}}
    abort error unless $?.success?
  end

  runner.call "which git",  "Couldn't find `git`!"
  runner.call "which yard", "Couldn't find `yard`!"

  runner.call %{
    git diff-files --quiet --ignore-submodules -- && \
      git diff-index --cached --quiet HEAD --ignore-submodules --
  }, "You must be on a clean branch to run this command"

  puts "Generating docs"

  Dir.mktmpdir do |dir|
    runner.call "yard doc -o #{dir}",    "Couldn't generate docs!"
    runner.call "git clean -fdx",        "Couldn't clean git index!"
    runner.call "git checkout gh-pages", "Couldn't checkout gh-pages branch!"
    runner.call "cp -r #{dir}/* .",      "Couldn't copy docs!"
  end

  puts "Done! Make sure to review the changes and push to GitHub!"
end
