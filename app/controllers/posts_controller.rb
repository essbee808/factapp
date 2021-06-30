class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @category = Category.find_or_create_by(name: @post.category_name)
    @category.posts << @post
    @post.save
    # (name: "Another Resource", description: "Short desc", organization: "FACT", category_name: "Vocational")
    redirect_to category_path(@category)
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:name, :organization, :description, :category_name)
  end
end
