class BooksController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit]

  def index
      @user = User.find(current_user.id)
      @books = Book.all.order(id: "DESC")
  	  @book = Book.new
  end

  def show
      @book = Book.new
      @books = Book.find(params[:id])
      @user = User.find(@books.user.id)
      @book_comment = BookComment.new
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

  def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_path
  end

  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
         redirect_to book_path(@book.id), notice: 'You have updated user successfully.'
      else
         render action: :edit
      end
  end


    private
    def correct_user
        @books = Book.find(params[:id])
        user = User.find(@books.user.id)
        if current_user == user
        else
           redirect_to books_path
        end
    end

    def book_params
    	  params.require(:book).permit(:title, :body, :user_id)
    end


end
