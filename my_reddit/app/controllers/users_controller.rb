class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      #add redirect_to somewhere
    else
      flash[:errors] = ["Oh no! Invalid Username or Password"]
      render :new
    end
  end

  def destroy
    #not sure if I really want this yet
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
