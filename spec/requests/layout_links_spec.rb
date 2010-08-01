require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

  it "should have a FAQ page at '/faq'" do
    get '/faq'
    response.should have_selector('title', :content => "FAQ")
  end

  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end

  it "should have a Privacy page at '/privacy'" do
    get '/privacy'
    response.should have_selector('title', :content => "Privacy")
  end

  it "should have a Sign Up page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign Up")
  end

  describe "when not logged in" do
    it "should have a Log In link" do
      visit root_path
      response.should have_selector("a", :href => login_path,
                                    :content => "Log In")
    end
  end

  describe "when logged in" do

    before(:each) do
      @user = Factory(:user)
      visit login_path
      fill_in :email,    :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end

    it "should have a Log Out link" do
      visit root_path
      response.should have_selector("a", :href => logout_path,
                                    :content => "Log Out")
    end

    it "should have a Profile link" do
      visit root_path
      response.should have_selector("a", :href => user_path(@user),
                                    :content => "Profile")
    end
  end
end
