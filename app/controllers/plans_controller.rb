class PlansController < ApplicationController
  def index
    plans = Plan.all
    render json: plans, status: :ok
  end

  def show
    plan = Plan.find(params[:id])
    render json: plan, status: :ok
  end
end
