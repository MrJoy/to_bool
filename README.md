# to_bool

## Summary

This gem extends various classes to provide a simple and intuitive to_bool
operator that tends to Do What You Mean when retrieving a value from an ENV var
or from an HTTP request and treating it as a boolean.

For example:

`false`, "false", "f", "no", "n", "0", "", and `nil` are all considered false
whereas `true`, "true", "t", "yes", "y", "1", etc are all considered true.

Instances of `FalseClass` and `TrueClass` remain the same, and `Fixnum` is
overridden such that 0 is considered false but all other values are considered
true.

See the (very very short) source code for exact details.


## Installation and Usage

Install the gem:

```ruby
gem install to_bool
```

Or if you're using bundler, add this line to your `Gemfile` and run
`bundle install`:

```ruby
gem 'to_bool'
```

From there, any object should respond to `.to_bool` in a meaningful way.
