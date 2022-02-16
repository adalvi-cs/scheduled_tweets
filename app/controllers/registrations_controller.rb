class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        #params
        # #Parameters: {"authenticity_token"=>"[FILTERED]", "user"=>{"email"=>"yy@y.com", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Sign Up"}
        #render plain: "Thanks!"
        #render plain: params[:user]
        @user = User.new(user_params)
        if @user.save
            #store user_id as a session cookie on server side
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Successfully created account"
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end    
end