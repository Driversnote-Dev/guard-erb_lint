# Guard::ErbLint

Automatically lints your ERB view files using [Guard](https://github.com/guard/guard) and the [Shopify/erb_lint](https://github.com/Shopify/erb-lint) gem.

## Usage

Add this line to your application's Gemfile:

```ruby
gem("guard-erb_lint", git: "https://github.com/Driversnote-Dev/guard-erb_lint")
```

And then execute:

```bash
bundle install
bundle exec guard init erb_lint
```

Or just add the following to your Guardfile:
```ruby
guard(:erb_lint) do
  watch(/.+\.erb$/)
  watch(/.+\.html$/)
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Driversnote-Dev/guard-erb_lint.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
