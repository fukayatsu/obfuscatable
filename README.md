# obfuscatable

[![Gem Version][gem-image]][gem-link]
[![Dependency Status][deps-image]][deps-link]
[![Build Status][build-image]][build-link]
[![Code Climate][gpa-image]][gpa-link]

**Make your ActiveRecord ids non-obvious**

This gem is just a fork from [obfuscate_id](https://github.com/namick/obfuscate_id) but I made the obfuscation optional because it affects to some conditions and causes errors.

## Installation

Add the gem to your Gemfile.

```ruby
gem "obfuscatable"
```

Run bundler.

```ruby
bundle install
```

## Usage
 
In your model, add a single line.  

```ruby
class Post < ActiveRecord::Base
  obfuscatable
end
```

Then use it with `to_param` or direct object passing in the view.

```ruby
link_to 'Post', post_path(@post.to_param)
link_to 'Post', post_path(@post)
```

And in your controller.

```ruby
class PostController < ApplicationController
  def show
    Post.find(params[:id], obfuscated: true)
  end
end
```

## Customization

If you want your obfuscated ids to be different than some other website using the same plugin, you can throw a random number (spin) at obfuscatable to make it hash out unique ids for your app.

```ruby
class Post < ActiveRecord::Base
  obfuscatable :spin => 89238723
end
```




[gem-image]:   https://badge.fury.io/rb/obfuscatable.svg
[gem-link]:    http://badge.fury.io/rb/obfuscatable
[build-image]: https://travis-ci.org/dtaniwaki/obfuscatable.svg
[build-link]:  http://travis-ci.org/dtaniwaki/obfuscatable
[deps-image]:  https://gemnasium.com/dtaniwaki/obfuscatable.png
[deps-link]:   https://gemnasium.com/dtaniwaki/obfuscatable
[gpa-image]:   https://codeclimate.com/github/dtaniwaki/obfuscatable/badges/gpa.svg
[gpa-link]:    https://codeclimate.com/github/dtaniwaki/obfuscatable

