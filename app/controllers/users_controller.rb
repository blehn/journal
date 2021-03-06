class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    respond_to do |format|
      format.xml { render :xml => @posts}
      format.html { render :csv => @posts}
    end
  end

  def new
    @user = User.new
    @title = "Sign Up"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign Up"
      render 'new'
    end
  end

  def edit
    @title = "Edit User"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit User"
      render 'edit'
    end
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

end
