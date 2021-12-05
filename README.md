# Guard::ErbLint

Automatically lints your ERB view files using [Guard](https://github.com/guard/guard) and the [Shopify/erb_lint](https://github.com/Shopify/erb-lint) gem.

## Usage

Add this line to your application's Gemfile:

```ruby
gem("guard-erb_lint", git: "https://github.com/mathiashsteffensen/guard-erb_lint")
```

And then execute:

```bash
bundle install
bundle exec guard init erb_lint
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mathiashsteffensen/guard-erb_lint.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
