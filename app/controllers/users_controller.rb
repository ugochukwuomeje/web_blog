class UsersController < ApplicationController

   before_action :set_user, only: [:edit, :update, :show]
   before_action :require_same_user, only: [:edit, :update]#this ensures that you can only edit your own account


    def index
      #this does thesame as our User.all except it will pagenate it.
      @users = User.paginate(page: params[:page], per_page: 5)
    end

    def new
       @user = User.new

    end

    def create
      # debugger
     @user = User.new(user_params)
     if @user.save
        #after signing in st the session variable
        session[:user_id] = @user.id
        flash[:success] = "welcome to the alpha blog #{@user.username}"
        redirect_to user_path(@user)
     else

        render 'new'
    end
   end

   
   def edit
      
   end

   def update
     
     if @user.update(user_params)
       flash[:success] = "Your Account was updated successfully"
       redirect_to articles_path
      else
      render 'edit'
     end
   end

   def show
      
      @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
   end

   def set_user
      @user = User.find(params[:id])
   end

    private
    def user_params
        #this creates a new user object with the parameters that were passed
       params.require(:user).permit(:username, :email, :password)
    end

   def require_same_user
      if !logged_in && cuurent_user != @user
         flash[:danger] = "You can only edit your own account"
         redirect_to root_path
      end
   end
end