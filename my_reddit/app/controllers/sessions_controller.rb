class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login(@user)
      #redirect_to somewhere over the rainbow
    else
      flash[:errors] = ["You did it wrong!"]
      render :new
    end
  end

  def destroy
    logout
  end
end
