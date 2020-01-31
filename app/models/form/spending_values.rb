class Form::SpendingValue < SpendingValue
	REGISTRABLE_ATTRIBUTES = %i(spending_id year_month value description)
	attr_accessor :spending_id
	attr_accessor :year_month
	attr_accessor :value
	attr_accessor :description
end