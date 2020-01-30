class SpendingsController < ApplicationController
  def index
    @spendings = Spending.order(created_at: :asc)
	end

  def show
    @spending = Spending.find(params[:id])
	end

  def new
    @spending = Spending.new()
	end

  def edit
    @spending = Spending.find(params[:id])
	end

  def create

	end

  def update

	end

  def destroy

  end

end
