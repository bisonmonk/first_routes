class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    #render json: params
    user = User.new(user_params)

    if user.save
      render json: user
    else
      render json: user.errors.full_messages
    end
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      render json: user
    else
      render json: user.errors.full_messages
    end
  end

  def destroy
    User.find(params[:id]).destroy
    render json: 'User has been destroyed.'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username)
  end
end
