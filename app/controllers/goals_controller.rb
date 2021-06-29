class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new
    #raise params.inspect
    if @goal.valid?
      @goal.save
      redirect_to goal_path(@goal)
    else
      render :new
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def edit
    @goal = Goal.find(goals_params)
  end

  private

  def goals_params
    params.require(:goal).permit(:name, :description)
  end
end
