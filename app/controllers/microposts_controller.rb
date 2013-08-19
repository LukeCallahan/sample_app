class MicropostsController < ApplicationController

	before action :signed_in_user, only: [:create, :destroy]
	before action :correct_user, only: :destroy


	def index
	end


	def create
		@micropost = current.user.micropost.build(micropost_params)
		if @micropost.save
			flash[:success] = "Micropost created!"
			redirect_to root_url

		else
			@feed_items = []
			render 'static_page/home'
		end
	end

	def destroy
		@micropost.destroy
		redirect_to root_url
	end

	private
		def micropost_params
			params.require(:micropost).permit(:content)
		end

		def correct_user
			@micropost = current_user.microposts.find_by(id: params[id])
			redirect_to root_url if @micropost.nil?
		end

end