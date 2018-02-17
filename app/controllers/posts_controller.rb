class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def edit
    @post= current_user.posts.find_by(id: params[:id])
    if @post.nil?
      flash[:alert] = "Unauthorized"
      redirect_to root_path
    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "Post Updated"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = @post.errors.full_messages.to_sentence
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.new
  end

  def create
  @post = current_user.posts.new(post_params)

    if @post.save
      flash[:notice] = "Post Created"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = @post.errors.full_messages.to_sentence
      render "new"
    end
  end

  private

  def post_params
      params.require( :post).permit( :title, :body)
  end
end
