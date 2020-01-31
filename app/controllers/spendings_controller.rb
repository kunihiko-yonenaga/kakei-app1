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
      @spending = Spending.new(params[:spending])
      if @spending.save
        redirect_to @spending, notice: "支出科目を登録しました"
      else
        render "new"
      end
	end

  def update
      @spending = Spending.find(params[:id])
      @spending.assign_attributes(params[:spending])
      if @spending.save
        redirect_to @spending, notice: "支出科目を登録しました"
      else
        render "new"
      end
	end

  def destroy
    @spending = Spending.find(params[:id])
		@spending.destroy
		redirect_to :spendings, notice: "科目を削除しました。"
  end

end
