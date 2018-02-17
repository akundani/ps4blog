class PostsController < ApplicationController
  def edit
    @post= Post.find(params[:id])
  end

  def update
  end 
  
  def show
    @post = Post.find(params[:id])
  end
  
  def index
    @posts = Post.all
  end 
  
  def new 
    @post = Post.new
  end
  def create 
  @post = Post.new(post_params)
  
  if @post.save
    redirect_to posts_path
  else 
    render "new"
  end
end

def post_params
    params.require( :post).permit( :title, :body)
end 

end

