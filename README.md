# WiseDl

A little smart downloader.

### Smart points

- do retry if target url status is not 200
- accept http and https request
- accept http redirect

## Installation

```ruby
gem 'wise_dl'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wise_dl

## Usage

```
require 'wise_dl'
res = WiseDl::Client.new({url: "http://img.gifmagazine.net/gifmagazine/images/693846/medium.gif"}).result # result is net/http object
res.body # return the url image data
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/YuheiNakasaka/wise_dl.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

