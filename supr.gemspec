# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{supr}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Blake Chambers"]
  s.date = %q{2010-11-04}
  s.description = %q{Use the su.pr API to shorten or expand URLs}
  s.email = %q{chambb1@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "lib/supr.rb",
     "lib/supr/client.rb",
     "lib/supr/url.rb",
     "lib/supr/utils.rb",
     "lib/supr/version.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/supr_spec.rb"
  ]
  s.homepage = %q{http://github.com/blakechambers/supr}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Use the su.pr API to shorten or expand URLs}
  s.test_files = [
    "spec/spec_helper.rb",
     "spec/supr_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_runtime_dependency(%q<crack>, [">= 0.1.4"])
      s.add_runtime_dependency(%q<httparty>, [">= 0.5.2"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<crack>, [">= 0.1.4"])
      s.add_dependency(%q<httparty>, [">= 0.5.2"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<crack>, [">= 0.1.4"])
    s.add_dependency(%q<httparty>, [">= 0.5.2"])
  end
end
