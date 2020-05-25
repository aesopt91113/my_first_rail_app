class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:create]
  before_action :set_post, only: [:update, :destroy]

  def index
    @posts = Post.all

    render 'index.jbuilder'
  end

  def create
    @post = @user.posts.create(post_params)

    render 'show.jbuilder'
  end

  def update
    @post.update(post_params)

    render 'show.jbuilder'
  end

  def destroy
    @post.destroy

    render 'show.jbuilder'
  end

  private

  def set_user
    @user = User.find_by(id: params[:user_id])

    if @user.nil?
      render plain: 'no user found'
    end
  end

  def set_post
    @post = Post.find_by(id: params[:id])

    if @post.nil?
      render plain: 'no post found'
    end
  end

  def post_params
    params.require(:post).permit(:content, :title)
  end
end
