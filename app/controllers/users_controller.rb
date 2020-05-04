class UsersController < ApplicationController
    def new
       @user = User.new

    end

    def create
     @user = User.new(user_params)
     if @user.save
        flash[:success] = "welcome to the alpha blog #{@user.username}"
        redirect_to articles_path
     else

        render 'new'
    end

    private
    def user_params
        #this creates a new user object with the parameters that were passed
       params.require(:user).permit(:usename, :email, :password)
    end
end