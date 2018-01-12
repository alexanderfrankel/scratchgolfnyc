class SessionsController < ApplicationController
  skip_before_action :authenticate

  def create
    @user = User.find_by(email: auth_params[:email])
    if @user.authenticate(auth_params[:password])
      auth_token = Auth.encode({user: @user.id})
      render json: {auth_token: auth_token}
    else
      render json: {error: "unauthorized"}, status: 401
    end
  end

  private

  def auth_params
    params.require(:auth).permit(:email, :password)
  end
end
