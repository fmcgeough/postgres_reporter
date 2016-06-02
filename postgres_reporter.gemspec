# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'postgres_reporter/version'

Gem::Specification.new do |spec|
  spec.name          = 'postgres_reporter'
  spec.version       = PostgresReporter::VERSION
  spec.authors       = ['fmcgeough']
  spec.email         = ['fmcgeough@gmail.com']

  spec.summary       = 'Provide easy means to run SQL reports on aws instance'
  spec.description   = <<-EOF
    Provide easy means to run SQL reports on Postgres. This simple gem is
    just a wrapper around using COPY from Ruby.
  EOF
  spec.homepage      = 'https://github.com/postgres_reporter'
  spec.license       = 'MIT'
  spec.files = `git ls-files -z`.split("\x0").reject { |f|
    f.match(%r{^(test)/})
  }
  spec.bindir        = 'bin'
  spec.executables   = 'postgres_reporter'
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.8', '>= 5.8.0'
  spec.add_development_dependency 'rubocop', '~> 0.37'
  spec.add_development_dependency 'simplecov', '~> 0.10'
  spec.add_development_dependency 'rdoc', '~> 4'
  spec.add_runtime_dependency 'pg', '~> 0.17', '>= 0.17.1'
end
