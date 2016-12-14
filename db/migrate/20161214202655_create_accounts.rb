class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :ico
      t.references :tenant, foreign_key: true

      t.timestamps
    end
  end
end
