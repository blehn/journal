require 'spec_helper'

describe PagesController do
  render_views
  describe "GET 'home'" do
    it "should have the right title" do
      get 'home'
      response.should have_selector("title",
        :content => "Journl | Definitely not a blog. | Home")
    end
  end

  describe "GET 'about'" do
    it "should have the right title" do
      get 'about'
      response.should have_selector("title",
        :content => "Journl | Definitely not a blog. | About")
    end
  end

end
