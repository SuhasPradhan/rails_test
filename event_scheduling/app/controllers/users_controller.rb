class UsersController < ApplicationController

	def create
		@user= User.new(user_params)
		@user.save
		session[:user_id] = @user.id

		redirect_to user_login_path
	end

	def edit
		
	end

	def update
		
	end

	private
		def user_params
			params.require(:user).permit(:firstname,:lastname,:username,:email,:password,:password_confirmation)
		end
end
