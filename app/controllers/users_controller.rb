class UsersController < ApplicationController
  before_action :authenticate_user!

  def show; end

  def update
    if current_user.update_attributes(user_params)
      render :show
    else
      errors = { errors: current_user.errors }
      json_response(errors, :unprocessable_entity)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :image)
  end
end
