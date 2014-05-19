class UsersController < ApplicationController
	
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Thank you for signing up!"
			session[:remember_token] = @user.id
			@current_user = @user
			redirect_to users_path
		else
			render :new
		end	
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(params.require(:user).permit(:name, :email, :attendance))
			redirect_to users_path
		else
			render 'edit'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		redirect_to users_path
	end

	def message
	@message = User.find(params[:id])

	end



	protected

	def user_params
    	params.require(:user).permit(:email, :password, :name, :attendance, :message, :phoneNum)
  	end
end