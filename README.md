# Express::Checkout

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/express/checkout`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'express-checkout'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install express-checkout

## Usage

init with your account

    @request = Express::Checkout::Request.new(
      username: your_user_name,
      password: your_password,
      signature: your_signature
    )

create a new payment

    payment_request = Express::Payment::Request.new(
        currency_code: :TWD,
        description: your_description,
        quantity: 1,
        amount: 999,
        custom_fields: {
          CARTBORDERCOLOR: 'C00000',
          LOGOIMG: 'https://example.com/logo.png'
        }
    )
    @response = @request.setup(
      payment_request,
      return_URL,
      client_back_URL
    )

checkout

    payment_request = Express::Payment::Request.new(
        currency_code: :TWD,
        description: your_description,
        quantity: 1,
        amount: 999,
        custom_fields: {
          CARTBORDERCOLOR: 'C00000',
          LOGOIMG: 'your_logo_url'
        }
    )
    response = @request.checkout!(
        token,
        PayerID,
        payment_request
    )
    


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/express-checkout/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
