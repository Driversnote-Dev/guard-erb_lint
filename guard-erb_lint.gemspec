# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "guard-erb_lint"
  spec.version       = "1.0.0"
  spec.authors       = ["Mathias H Steffensen"]
  spec.email         = ["mathiashsteffensen@protonmail.com"]

  spec.summary       = "Guard plugin for erb_lint"
  spec.homepage      = "https://github.com/mathiashsteffensen/guard-erb_lint"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/CHANGELOG.md"

  spec.files =
    Dir.chdir(File.expand_path(__dir__)) do
      %x(git ls-files -z).split("\x0").reject { |f| f.match(%r{\A(?:spec|features)/}) }
    end

  spec.require_paths = ["lib"]

  spec.add_dependency("activesupport")
  spec.add_dependency("erb_lint")
  spec.add_dependency("guard-compat", ">= 1")

  spec.add_development_dependency("rake", "13.0")

  spec.add_development_dependency("guard")
  spec.add_development_dependency("guard-rubocop")

  spec.add_development_dependency("rubocop")
  spec.add_development_dependency("rubocop-rspec")
  spec.add_development_dependency("rubocop-shopify")
end
