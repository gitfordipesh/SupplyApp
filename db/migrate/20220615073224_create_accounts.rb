class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :accNo
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
