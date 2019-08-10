class UsersController < ApplicationController
	def dashboard
		@roles = ListOfRole.all.pluck(:role)
		@user = User.new
	end

	def create
		@user = User.find_by email: params["user"]["email"] 
		if @user.present?
			flash[:error] = "Email already existed"
		else
			
			@user = User.new
			@user.first_name = params["user"]["first_name"]
			@user.last_name = params["user"]["last_name"]
			@user.role = params["user"]["role"]
			@user.email = params["user"]["email"]
			@user.image = params["image"]
			if @user.save
				flash[:success] = "User created"
				redirect_to show_users_path
			else
				flash[:notice] = "something went wrong"
			end
		end
	end

	def hide_roles
		@roles = ListOfRole.all
	end

	def role_create 
		@role = ListOfRole.find_by(role:params["checkbox_val"]) rescue ""
		if @role.present?
			@role.update(is_hide:params["checkbox_status"])
		end
	end

	def show_users
		@roles = ListOfRole.all.pluck(:role)
	end

	def show_users_based_on_role
		@user_data = User.where(role: params["role"])
		render :partial=>"list_of_users", :locals=>{:user_data=>@user_data}
		return 
	end

	private
	def user_params
		binding.pry
		params.require(:user).permit(:first_name,:last_name,:email,:role,:image)
	end
end
