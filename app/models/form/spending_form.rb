class Form::SpendingForm < Form::Base
	attr_accessor :spending_values

	def initialize(attributes = {})
    super attributes
		spendings = Spending.order(created_at: :asc)
		self.spending_values = spendings.map { |spending| SpendingValue.new(spending_id: spending.id) } unless spending_values.present?
  end

	def spending_values_attributes=(attributes)
    self.spending_values = attributes.map do |_, spending_value_attributes|
      Form::SpendingValue.new(spending_value_attributes).tap { |v| puts v}
    end

  end

	def valid?
		valid_spending_values = self.spending_values.map(&:valid?).all?
		super && valid_spending_values
	end

	def save
		return false unless valid?
		SpendingValue.transaction {
			self.spending_values.select.each { |spending_value|
				a1 = SpendingValue.new(:spending_id => spending_value.spending_id,
					:year_month => spending_value.year_month,
					:value => spending_value.value,
					:description => spending_value.description)
				a1.save!
			 }
		}
		true
	end

	def target_spending_values
		self.spending_values.select { |v| '*' }
	end

end