class PlansController < ApplicationController
  def index
    plans = Plan.all

    respond_to do |format|
      format.json { render json: plans, status: :ok }
      format.xml { render xml: plans, status: :ok }
    end
  end

  def show
    plan = Plan.find(params[:id])

    respond_to do |format|
      format.json { render json: plan, status: :ok }
      format.xml { render xml: plan, status: :ok }
    end
  end

  def create
    plan = Plan.new(plan_params)
    if plan.save
      render json: plan, status: 201, location: plan
    end
  end

  private
    def plan_params
      params.require(:plan).permit(:name, :description)
    end
end
