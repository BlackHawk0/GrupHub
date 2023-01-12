class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :total_prize
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end
