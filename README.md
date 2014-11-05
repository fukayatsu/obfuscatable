# obfuscatable

[![Build Status](https://secure.travis-ci.org/namick/obfuscatable.png)](http://travis-ci.org/namick/obfuscatable) [![Dependency Status](https://gemnasium.com/namick/obfuscatable.png)](https://gemnasium.com/namick/obfuscatable) [![Code Climate](https://codeclimate.com/github/namick/obfuscatable.png)](https://codeclimate.com/github/namick/obfuscatable)

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
