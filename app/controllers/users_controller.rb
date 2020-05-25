class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @user = User.create(user_params)

    render 'show.jbuilder'
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :first_name, :last_name)
  end
end
