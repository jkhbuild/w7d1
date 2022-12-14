class UsersController < ApplicationController
    def new
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            render user_url(@user)
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end