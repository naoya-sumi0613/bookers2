class RelationshipsController < ApplicationController
	def create
		user = User.find(params[:user_id])
		follow = current_user.followed.new(follower_id: user.id)
		follow.save
		redirect_back(fallback_location:root_path)
	end

	def destroy
		user = User.find(params[:user_id])
		follow = current_user.followed.find_by(follower_id: user.id)
		follow.destroy
		redirect_back(fallback_location:root_path)
	end

	def follow
		@users = User.where(followed_id: :id)
	end


	private
	def relationship_params
		params.require(:relationship).permit(:followed_id, :follower_id)
	end

end
