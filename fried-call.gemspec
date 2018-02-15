lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fried/call/version"

Gem::Specification.new do |spec|
  spec.name          = "fried-call"
  spec.version       = Fried::Call::VERSION
  spec.authors       = ["Fire-Dragon-DoL"]
  spec.email         = ["francesco.belladonna@gmail.com"]

  spec.summary       = %q{Service objects interfaces and utilities}
  spec.description   = %q{Service objects interfaces and utilities}
  spec.homepage      = "https://github.com/Fire-Dragon-DoL/fried-call"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "fried-test"

  spec.add_runtime_dependency "fried-core"
end
