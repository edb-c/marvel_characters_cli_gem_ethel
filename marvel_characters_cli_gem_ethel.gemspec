
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "marvel_characters_cli_gem_ethel/version"

Gem::Specification.new do |spec|
  spec.name          = "marvel_characters_cli_gem_ethel"
  spec.version       = MarvelCharactersCliGemEthel::VERSION
  spec.authors       = ["edb-c"]
  spec.email         = ["edb.cofresi@gmail.com"]
  spec.summary       = %q{Ruby Object-oriented programming - CLI -Marvel Characters }
  spec.homepage      = "https://github.com/edb-c/marvel_characters_cli_gem_ethel"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
end
