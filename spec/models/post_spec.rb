require 'spec_helper'

describe Post do

  before(:each) do
    @user = Factory(:user)
    @attr = { :content => "value for content" }
  end

  it "should create a new instance given valid attributes" do
    @user.posts.create!(@attr)
  end

  describe "user associations" do
    
    before(:each) do
      @post = @user.posts.create(@attr)
    end

    it "should have a user attribute" do
      @post.should respond_to(:user)
    end
    
    it "should have the right associated user" do
      @post.user_id.should == @user.id
      @post.user.should == @user
    end
  end
end
