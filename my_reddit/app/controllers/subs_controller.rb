class SubsController < ApplicationController
  before_action :require_login

  def new
    render :new
  end

  def create
    sub = Sub.new(sub_params)
    sub.user_id = current_user.id
    if sub.save
      redirect_to sub_url(sub)
    else
      flash[:errors] = ["some stuff"]
      render :new
    end
  end

  def edit
  end

  def update
    sub = current_user.subs.find(params[:id])
    if sub.update_attributes(sub_params)
      redirect_to sub_url(sub)
    else
      flash[:errors] = ["boom"]
      render :edit
    end
  end

  def destroy
    #ooptional
  end

  def show
  end

  def index
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

end
