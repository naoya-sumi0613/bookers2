class SearchsController < ApplicationController
  def search
      if params[:or] == "Users"
      	 if params[:how] == "完全一致"
            @users = User.where('name LIKE ?', "#{params[:name]}")
         elsif params[:how] == "前方一致"
         	@users = User.where('name LIKE ?', "#{params[:name]}%")
         elsif params[:how] == "後方一致"
         	@users = User.where('name LIKE ?', "%#{params[:name]}")
         else
         	@users = User.where('name LIKE ?', "%#{params[:name]}%")
         end

      else
      	 if params[:how] == "完全一致"
            @books = Book.where('title LIKE ?', "#{params[:name]}")
      	 elsif params[:how] == "前方一致"
      	 	@books = Book.where('title LIKE ?', "#{params[:name]}%")
      	 elsif params[:how] == "後方一致"
      	 	@books = Book.where('title LIKE ?', "%#{params[:name]}")
      	 else
      	 	@books = Book.where('title LIKE ?', "%#{params[:name]}%")
      	 end
      end
  end
end
