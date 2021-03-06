require 'spec_helper'

describe PostsController do
  render_views

  describe "access control" do

    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(login_path)
    end

    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to(login_path)
    end
  end

  describe "POST 'create'" do

    before(:each) do
      @user = test_log_in(Factory(:user))
    end

    describe "failure" do

      before(:each) do
        @attr = { :content => "" }
      end

      it "should not create a post" do
        lambda do
          post :create, :post => @attr
        end.should_not change(Post, :count)
      end

      it "should render the home page" do
        post :create, :post => @attr
        response.should render_template('pages/home')
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :content => "Lorem ipsum" }
      end

      it "should create a post" do
        lambda do
          post :create, :post => @attr
        end.should change(Post, :count).by(1)
      end

      it "should redirect to the home page" do
        post :create, :post => @attr
        response.should redirect_to(root_path)
      end

      it "should have a flash message" do
        post :create, :post => @attr
        flash[:success].should =~ /post created/i
      end
    end
  end

  describe "DELETE 'destroy'" do

    describe "for an unauthorized user" do

      before(:each) do
        @user = Factory(:user)
        wrong_user = Factory(:user, :email => Factory.next(:email))
        test_log_in(wrong_user)
        @post = Factory(:post, :user => @user)
      end

      it "should deny access" do
        delete :destroy, :id => @post
        response.should redirect_to(root_path)
      end
    end

    describe "for an authorized user" do

      before(:each) do
        @user = test_log_in(Factory(:user))
        @post = Factory(:post, :user => @user)
      end

      it "should destroy the post" do
        lambda do
          delete :destroy, :id => @post
        end.should change(Post, :count).by(-1)
      end
    end
  end
end
