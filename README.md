# Fried::Call [![Build Status][test-badge]][test-link]

Service interface with some utilities.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "fried-call"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fried-call

## Usage

Two modules available for inclusion, `OnNew` which delegates `call` to `new`:

```ruby
class MyService
  include Fried::Call::OnNew

  def call(name)
    "hello #{name}"
  end
end

MyService.("John") # => hello John
MyService.new.("John") # => hello John
```

And `OnBuild` which delegates `call` to `build`:

```ruby
class MyService2
  include Fried::Call::OnBuild

  def initialize(name)
    @name = name
  end

  def self.build
    new(name)
  end

  def call
    "hello #{@name}"
  end
end

MyService2.("John") # => hello John
MyService2.build("John").call # => hello John
MyService2.new # => raises ArgumentError
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Fire-Dragon-DoL/fried-call.

[test-badge]: https://travis-ci.org/Fire-Dragon-DoL/fried-call.svg?branch=master
[test-link]: https://travis-ci.org/Fire-Dragon-DoL/fried-call
