class UsersController < ApplicationController
    skip_before_action :require_login, only: [:index, :new, :create] # this should only be used if you are allowing users to register themselves. 

    def index
        @users = User.all
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to(:users, notice: 'User was successfully created')
            
        else
            render:new
            login_path
        end
    end

    def show
    end
    
    private

  def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
