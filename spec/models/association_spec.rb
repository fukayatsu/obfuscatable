require 'spec_helper'

describe "Association" do
  describe '#find' do
    let (:post) { Post.create content: 'foo' }
    let (:comment) { Comment.create content: 'bar', post: post }
    subject { post.comments.find(comment.to_param) }

    it 'should find comment' do
      should eq(comment)
    end
  end
end
