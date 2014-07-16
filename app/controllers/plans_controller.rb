class PlansController < ApplicationController
  def index
    plans = Plan.where(archived: false)

    respond_to do |format|
      format.json { render json: plans, status: :ok }
      format.xml { render xml: plans, status: :ok }
    end
  end

  def show
    plan = Plan.find_unarchived(params[:id])

    respond_to do |format|
      format.json { render json: plan, status: :ok }
      format.xml { render xml: plan, status: :ok }
    end
  end

  def create
    plan = Plan.new(plan_params)

    if plan.save
      head 204, location: plan
    else
      render json: plan.errors, status: :unprocessable_entity
    end
  end

  def update
    plan = Plan.find_unarchived(params[:id])

    if plan.update(plan_params)
      render json: plan, status: :ok
    else
      render json: plan.errors, status: :unprocessable_entity
    end
  end

  def destroy
    plan = Plan.find_unarchived(params[:id])
    plan.archive
    head 204
  end

  private
    def plan_params
      params.require(:plan).permit(:name, :description, :archived)
    end
end
