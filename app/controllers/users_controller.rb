class UsersController < ApplicationController
  def index
      @books = Book.all
  	  @book = Book.new
  end

  def show
      @book = Book.find(params[:id])
  end

  def edit
      @book = Book.find(params[:id])
  end

  def create
  	  @book = Book.new(book_params)
      @book.user_id = current_user.id
  	  if @book.save
  	     redirect_to book_path(@book.id), notice: 'Book was successfully created.'
      else
         redirect_to books_path(@book.id)
      end
  end


    private
    def book_params
    	  params.require(:book).permit(:title, :body)
    end

end