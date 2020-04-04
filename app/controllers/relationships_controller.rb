class RelationshipsController < ApplicationController
	def create
		user = User.find(params[:user_id])
		follow = current_user.follower.new(followed_id: user.id)
		follow.save
		redirect_back(fallback_location:root_path)
	end

	def destroy
	end


	private
	def relationship_params
		params.require(:relationship).permit(:followed_id, :follower_id)
	end

end
