class SessionsController < ApplicationController
    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
          session[:user_id] = user.id
          render json: user, status: :created
        else
          render json: { error: "Invalid username or password" }, status: :unauthorized
        end
    end  
    
    def destroy
        # user = User.find(params[:id])
        session.delete :user_id
        head :no_content
    end

# private

#     def session_params
#         params.permit(:username, :password, :password_confirmation)
#     end
end
