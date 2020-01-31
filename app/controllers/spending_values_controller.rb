class SpendingValuesController < ApplicationController
  def index
		@spendings = Spending.order(created_at: :asc)
		@spending_values = SpendingValue.order("year_month asc")
	end

	def show
		@spending_value = SpendingValue.find(params[:id])
	end

	def new
		year_month_day = params[:year_month] + "-01"
		@year_month = year_month_day.to_date

		@spendings = Spending.order(created_at: :asc)
		@form = Form::SpendingForm.new
	end

	def edit
		@spending_value = SpendingValue.find(params[:id])
		@spending = Spending.find(@spending_value.spending_id)
	end

	def create
		@form = Form::SpendingForm.new(spending_form_params)
		if @form.save
			redirect_to :spending_values, notice: "登録しました"
		else
			redirect_to :spending_values, notice: "登録に失敗しました"
		end
	end

	def spending_form_params
		params
			.require(:form_spending_form)
			.permit(spending_values_attributes: Form::SpendingValue::REGISTRABLE_ATTRIBUTES)
	end

	def update
		@spending_value = SpendingValue.find(params[:id])
		@spending_value.assign_attributes(params[:spending_value])
		if @spending_value.save
			redirect_to :spending_values, notice: "情報を更新しました"
		else
			render "edit"
		end
	end

	def destroy
		@spending_value = SpendingValue.find(params[:id])
		@spending_value.destroy
		redirect_to :spending_values, notice: "データを削除しました。"
	end
end
