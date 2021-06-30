class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    #raise params.inspect
    if @category.valid?
      @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(category_params)
  end

  private

  def category_params
    params.require(:category).permit(:name, :description, post_ids: [])
  end
end
