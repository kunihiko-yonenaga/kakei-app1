class CreateSpendingValues < ActiveRecord::Migration[5.2]
  def change
    create_table :spending_values do |t|
      t.integer :spending_id
      t.date :year_month
      t.integer :value
      t.string :description

      t.timestamps
    end
  end
end
