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
  
  it "should have a Register page at '/register'" do
    get '/register'
    response.should have_selector('title', :content => "Register")
  end
end
