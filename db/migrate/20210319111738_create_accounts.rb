class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :account_type
      t.string :opened_at
      t.string :customer_id
      t.string :customer_name
      t.string :branch
      t.boolean :minor_indicator

      t.timestamps
    end
  end
end
