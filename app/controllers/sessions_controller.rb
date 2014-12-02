class SessionsController < Devise::SessionsController
  respond_to :json

  def create
    resource = User.find_for_database_authentication(email: params[:email])
    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:password])
      sign_in(:user, resource)
      render json: {success: true, user: UserSerializer.new(resource)}
      return
    else
      render json: {success: false, message: "Your password is incorrect"}, status: 401
    end
  end

  def destroy
    sign_out(current_user)
    render json: {success: true}
  end

  protected

  def invalid_login_attempt
    render json: {success: false, message: "User with such email not found"}, status: 401
  end
end