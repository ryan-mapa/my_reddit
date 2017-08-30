class PostsController < ApplicationController
  before_action :require_login

  def new
    render :new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    post.sub_id = params[:sub_id]
    if post.save
      redirect_to sub_url(post.sub)
    else
      flash[:errors]
      render :new
    end
  end

  def edit
  end

  def update
    post = current_user.posts.find(params[:id])
    if post.update_attributes(post_params)
      redirect_to sub_url(post.sub)
    else
      flash[:errors] = ["not yo stuff"]
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to sub_url(post.sub)
  end

  def show
  end

  def index
    #subs show to feature posts
  end

  def post_params
    params.require(:post).permit(:title, :url, :content)
  end

end
