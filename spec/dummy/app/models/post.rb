class Post < ActiveRecord::Base
  has_many :comments

  obfuscatable :spin => 123456789
end
