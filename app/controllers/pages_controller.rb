class PagesController < ApplicationController
  def home
    @title = "Home"
    if logged_in?
      @post = Post.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end

  def about
    @title = "About"
  end

  def faq
    @title = "FAQ"
  end

  def privacy
    @title = "Privacy"
  end

end
