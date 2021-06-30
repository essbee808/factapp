class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)
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
    @category = Category.find(categories_params)
  end

  private

  def categories_params
    params.require(:category).permit(:name, :description)
  end
end
