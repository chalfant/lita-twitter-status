Gem::Specification.new do |spec|
  spec.name          = "lita-twitter-status"
  spec.version       = "0.1.0"
  spec.authors       = ["Chris Chalfant"]
  spec.email         = ["chalfants@gmail.com"]
  spec.description   = "Make Lita respond with a twitter status"
  spec.summary       = "Make Lita respond with a twitter status"
  spec.homepage      = "https://github.com/chalfant/lita-twitter-status"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.3"
  spec.add_runtime_dependency "twitter"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
