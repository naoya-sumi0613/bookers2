class BooksController < ApplicationController

  before_action :correct_user, only: [:edit, :create, :destroy]

  def index
      @user = User.find(current_user.id)
      @books = Book.all.order(id: "DESC")
  	  @book = Book.new
  end

  def show
      @book = Book.new
      @books = Book.find(params[:id])
      @user = User.find(@books.user.id)
  end

  def edit
      @book = Book.find(params[:id])
  end

  def create
  	  @book = Book.new(book_params)
      @book.user_id = current_user.id
  	  if @book.save
  	     redirect_to book_path(@book.id), notice: 'You have creatad book successfully.'
      else
         @user = User.find(current_user.id)
         @books = Book.all.order(id: "DESC")
         render action: :index
      end
  end


    private
def correct_user
  @micropost = current_user.microposts.find_by(id: params[:id])
    unless @micropost
      redirect_to root_url
    end
    end

    def book_params
    	  params.require(:book).permit(:title, :body, :user_id)
    end


end
