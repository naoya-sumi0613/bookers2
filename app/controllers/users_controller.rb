class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit]


  def show
      @user = User.find(params[:id])
      @book = Book.new
      @books = @user.books.all.reverse_order
  end

  def index
      @book = Book.new
      @user = User.find(current_user.id)
      @users = User.all.order(id: "DESC")
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
         redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
      else
         render action: :edit
      end
  end

  def follow
      @user = User.find(params[:id])
      @users = @user.follower_user
  end

  def follower
      @user = User.find(params[:id])
      @users = @user.following_user
  end


    private
    def user_params
        params.require(:user).permit(:name, :profile_image, :introduction)
    end

    def correct_user
        user = User.find(params[:id])
        if current_user == user
        else
           redirect_to user_path(current_user.id)
        end
    end
end