class UserController < ApplicationController
    def create
        @user = login(params[:email], params[:password])
        
        if @user
          redirect_back_or_to(:users, notice: 'Login successful')
        else
          flash.now[:alert] = 'Login failed'
          render action: 'new'
        end

      def destroy
        logout
        redirect_to(:users, notice: 'Logged out!')
      end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end

end