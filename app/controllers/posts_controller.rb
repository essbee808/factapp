class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    # (name: "Another Resource", description: "Short desc", organization: "FACT", category_name: "Vocational")
    redirect_to posts_path(@post)
    # if @post.valid?
    #   @post.save
    #   #raise params.inspect
    #   redirect_to post_path(@post)
    # else
    #   render :new
    # end
    
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:name, :organization, :description, :category_name)
  end
end
